from django.conf import settings
from django.shortcuts import render
from .models import Weather, City
from django.db.models import Avg, F, TimeField
from django.db.models.functions import TruncDay, TruncWeek, TruncHour
from django.views.decorators.cache import cache_page
from django.views.decorators.vary import vary_on_cookie
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.utils import timezone
import json
import datetime
import logging


logger = logging.getLogger(__name__)
CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)
BASE_CITY = getattr(settings, 'BASE_CITY', 'London')



@cache_page(CACHE_TTL)
@vary_on_cookie
def index(request):
    try:
        ###no login - no choise
        n = BASE_CITY
        if (request.user.is_authenticated):
            if 'c' in request.GET:
                n = request.GET.get('c')
                request.session['fav_city'] = n
            elif 'fav_city' in request.session:
                n = request.session['fav_city']

        ###datetime settings
        dn = datetime.datetime.now().strftime('%Y-%m-%d')
        d = request.GET.get('d', dn)
        d = datetime.datetime.strptime(d, '%Y-%m-%d')
        d = d+datetime.timedelta(hours=23, minutes=59)
        d = d.replace(tzinfo=timezone.get_current_timezone())
        d = d.astimezone(timezone.utc)

        ###queries
        city = City.objects.get(name=n)

        weather = Weather.objects.filter(city=city, updated__gte=(d-datetime.timedelta(days=31)), updated__lte=(d))\
                .annotate(date=TruncDay('updated')).values('date')\
                .order_by('date').annotate(temps=Avg('temp'))
        
        weeked = Weather.objects.filter(city=city, updated__gte=(d-datetime.timedelta(days=366)), updated__lte=(d))\
                .annotate(date=TruncWeek('updated')).values('date')\
                .order_by('date').annotate(temps=Avg('temp'))

        timed = Weather.objects.filter(city=city, updated__gt=(d-datetime.timedelta(days=1)), updated__lte=(d))\
              .annotate(hour=TruncHour('updated'))\
              .values('hour').order_by('hour').annotate(temps=F('temp'))
        
        ###processing
        dy_grap = json.dumps({str(s['date']):round(s['temps'], 2) for s in weather})
        yr_grap = json.dumps({str(s['date']):round(s['temps'], 2) for s in weeked})
        if len(weather) % 2: weather=weather[1:]
        tabled  = list(zip(weather[len(weather)//2-1::-1], weather[:len(weather)//2-1:-1]))[::-1]        
        hr_grap   = json.dumps({f'{s["hour"].hour}:00' : s['temps'] for s in timed})

        context = {'list': tabled, 'dayed': dy_grap, 'timed': hr_grap, 'weeked': yr_grap, 'defcity': BASE_CITY}
        return render(request, 'index.html', context)


    except Exception as e:
        logger.warning(f'index processing error {e}')
        if request.user.is_authenticated:  request.session['fav_city'] = BASE_CITY
        return HttpResponseRedirect("404.html")



###city select
@login_required
@cache_page(CACHE_TTL)
def select(request):
    try:
      cities=City.objects.order_by('name').values_list('name', flat=True).distinct()
    except Exception as e:
      logger.warning(f'select processing error {e}')
      cities=[BASE_CITY] 
    return render(request, 'select.html', {'cnames' : cities})



###errors handlers
def handler404(request, *args, **argv):
    response = render_to_response('404.html', {},
                                  context_instance=RequestContext(request))
    response.status_code = 404
    return response







