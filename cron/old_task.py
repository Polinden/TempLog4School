import requests
import datetime
import json
import pytz
from celery import shared_task, states
import psycopg2
import os


APIWET=os.environ['APIWET']

@shared_task(bind=True,
             name='w_task',
             max_retries=3,
             soft_time_limit=20)
def w_task(self):
    con=0
    try:
        conn = psycopg2.connect(dbname='postgres', user='postgres', password='leedan', host='172.17.0.3') 
       
        s=requests.get(APIWET)
        if s.ok:
            s=json.loads(s.text)
            s=s['main']['temp']
        else:
            s='Error'

        sql = ''' INSERT INTO project1_weather(updated, temp, city_id) VALUES(%s,%s,%s) '''

        cur = conn.cursor()
        cur.execute(sql, (datetime.datetime.now(tz=pytz.timezone('EUROPE/KIEV')),float(s),1))  #todo!
        conn.commit()
        cur.close()

    except Exception as e:
        print(e)
    finally:
        if con:
            conn.close()

