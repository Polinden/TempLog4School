import requests
import datetime
import json
import pytz
from celery import shared_task, states
import psycopg2
import os


HOST='172.18.0.3'
MY_TZ='EUROPE/KIEV'


sql1 = ''' INSERT INTO project1_weather(updated, temp, city_id) VALUES(%s,%s,%s) '''
sql2 = ''' SELECT id, name FROM project1_city '''

def r_req(city):
    s='Error'
    try:
        APIWET=os.environ['APIWET']
        r=APIWET.format(city)
        s=requests.get(r)
        if s.ok:
            s=json.loads(s.text)
            s=s['main']['temp']
            s=float(s)
            return s
    except ValueError:
        print(f"{s} is not a float")
    except Exception as e:
        print(f"requests error {e}")
    return -100


def get_connection(host=HOST, password='leedan'):
    try:
       return psycopg2.connect(dbname='postgres', user='postgres', password=password, host=host) 
    except Exception as e:
       print(f"db connection error {e}")
       return 0


def get_cities():
    conn = get_connection()
    if not conn: return []
    try:
        cur = conn.cursor()
        cur.execute(sql2)  
        return cur.fetchall()
    except Exception as e:
        print(f"fetch cities error {e}")
    finally:
        cur.close()
        conn.close()
    return [] 


def get_cities_temp():
    return [(city[0], city[1], r_req(city[1])) for city in get_cities()]




###
## celery task
###
@shared_task(bind=True,
             name='w_task',
             max_retries=3,
             soft_time_limit=20)
def w_task(self):
    conn = get_connection()
    if not conn: return
    snt=get_cities_temp()
    if not snt: return
    try:
       cur = conn.cursor()
       for el in snt:
           if el[2] > -99:
               cur.execute(sql1, (datetime.datetime.now(tz=pytz.timezone(MY_TZ)), el[2], el[0]))  
       conn.commit()
    except Exception as e:
        print(f'store in db error {e}')
    finally:
        cur.close()
        conn.close()

