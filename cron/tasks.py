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
        s=requests.get(APIWET)
        if s.ok:
            s=json.loads(s.text)
            s=s['main']['temp']
        else:
            s=''
        conn = psycopg2.connect(dbname='postgres', user='postgres', 
                        password='leedan', host='192.168.77.33') 
        sql = ''' INSERT INTO project1_weather(updated, temp)
              VALUES(%s,%s) '''
        cur = conn.cursor()
        cur.execute(sql, (datetime.datetime.now(tz=pytz.timezone('EUROPE/KIEV')),float(s)))
        conn.commit()
        cur.close()
    except Exception as e:
        print(e)
    finally:
        if con:
            conn.close()

