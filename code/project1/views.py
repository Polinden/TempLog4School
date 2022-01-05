from django.conf import settings
from django.shortcuts import render
from .models import Weather, City
from django.db.models import Avg, F, TimeField
from django.db.models.functions import TruncDate, TruncHour
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.http import HttpResponseRedirect
from django.utils import timezone
import json
import datetime
import logging


logger = logging.getLogger(__name__)
CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)
BASE_CITY = 'Kiev'


@cache_page(CACHE_TTL)
@vary_on_cookie
def index(request):
    try:
        ###request parsing
        n=request.GET.get('c', BASE_CITY)

        dn=datetime.datetime.now().strftime('%Y-%m-%d')
        d=request.GET.get('d', dn)
        d=datetime.datetime.strptime(d, '%Y-%m-%d')
        d=d+datetime.timedelta(hours=23, minutes=59)
        d=d.replace(tzinfo=timezone.get_current_timezone())
        d=d.astimezone(timezone.utc)

        ###queries
        city=City.objects.get(name=n)

        weather=Weather.objects.filter(city=city, updated__gte=(d-datetime.timedelta(days=366)), updated__lte=(d))\
             .annotate(date=TruncDate('updated')).values('date').order_by('date').annotate(temps=Avg('temp'))
        
        timed=Weather.objects.filter(city=city, updated__gt=(d-datetime.timedelta(days=1)), updated__lte=(d))\
             .annotate(hour=TruncHour('updated'))\
             .values('hour').order_by('hour').annotate(temps=F('temp'))
        
        #processing
        graphed = json.dumps({str(s['date']):round(s['temps'],2) for s in weather})
        if (len(weather)%2):
            weather=weather[1:]
        tabled=list(zip(weather[len(weather)//2-1::-1], weather[:len(weather)//2-1:-1]))[::-1]        
        timed = json.dumps({f'{s["hour"].hour}:00' : s['temps'] for s in timed})

        #set session var
        if ['fav_city'] not in request.session:
            request.session['fav_city'] = 'Kiev'

        context = {'list': tabled, 'graphed':graphed, 'timed':timed}
        return render(request, 'index.html', context)


    except Exception as e:
        logger.warning(f'request processing error {e}')
        return HttpResponseRedirect("404.html")


def handler404(request, *args, **argv):
    response = render_to_response('404.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response
