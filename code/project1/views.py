from django.conf import settings
from django.shortcuts import render
from .models import Weather
from django.db.models import Avg, F, TimeField
import json
import datetime
from django.utils import timezone
from django.db.models.functions import TruncDate, TruncHour
from django.views.decorators.cache import cache_page
from django.core.cache.backends.base import DEFAULT_TIMEOUT
import logging


logger = logging.getLogger(__name__)
CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)


@cache_page(CACHE_TTL)
def index(request):
    try:
        dn=datetime.datetime.now().strftime('%Y-%m-%d')
        d=request.GET.get('d', dn)
        d=datetime.datetime.strptime(d, '%Y-%m-%d')
        d=d+datetime.timedelta(hours=23, minutes=59)
        d=d.replace(tzinfo=timezone.get_current_timezone())
        d=d.astimezone(timezone.utc)


        weather=Weather.objects.filter(updated__gte=(d-datetime.timedelta(days=366)), updated__lte=(d))\
             .annotate(date=TruncDate('updated')).values('date').order_by('date').annotate(temps=Avg('temp'))
        
        timed=Weather.objects.filter(updated__gt=(d-datetime.timedelta(days=1)), updated__lte=(d))\
             .annotate(hour=TruncHour('updated'))\
             .values('hour').order_by('hour').annotate(temps=F('temp'))
        
        graphed = json.dumps({str(s['date']):round(s['temps'],2) for s in weather})
        if (len(weather)%2):
            weather=weather[1:]
        tabled=list(zip(weather[len(weather)//2-1::-1], weather[:len(weather)//2-1:-1]))[::-1]        
        timed = json.dumps({f'{s["hour"].hour}:00' : s['temps'] for s in timed})


        context = {'list': tabled, 'graphed':graphed, 'timed':timed}
        return render(request, 'index.html', context)
    except Exception as e:
        logger.warning(str(e))
        return render(request, 'index.html', {'list':[], 'graphed':'{}', 'timed':'{}'})

