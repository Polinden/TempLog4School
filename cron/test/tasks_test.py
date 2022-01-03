import os
import sys
import inspect

currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
parentdir = os.path.dirname(currentdir)
sys.path.insert(0, parentdir)

import tasks
from tasks import *

###
###TESTS+++++++++++++++++
###


import pytest

@pytest.fixture(autouse=True)
def connection(monkeypatch):
    def mc():
        try:
          return psycopg2.connect(dbname='postgres', user='postgres', password='leedan', host='localhost') 
        except Exception as e:
           print(f"db connection error {e}")
           return 0
    import sys
    ss=sys.modules[__name__]
    monkeypatch.setattr(tasks, "get_connection", mc)
    monkeypatch.setenv("APIWET", "https://api.openweathermap.org/data/2.5/weather?q={0}&appid=****&units=metric")



def test_good_api():
   r=r_req('Kiev')
   print (r)
   assert  r > -10

def test_bad_api():
   r=r_req('Kuev')
   assert  r == -100

def test_city_list():
   r=get_cities()
   assert  r == [(1,'Kiev'), (2,'Moscow')]

def test_city_temps():
   r=get_cities_temp()
   f1=[(a[0],a[1]) for a in r]
   f2=[a[2] for a in r]
   assert f1 == [(1,'Kiev'), (2,'Moscow')] 
   assert -100 not in f2 
  

def test_all():
    w_task()
    assert 1==1
