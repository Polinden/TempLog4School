import os

from celery import Celery
from celery.schedules import crontab

app = Celery('tasks',
             include=['cron.tasks'],
             backend='redis://172.18.0.2',
             broker='redis://172.18.0.2', )

app.conf.update(result_expires=3600,
                enable_utc=True,
                timezone='Europe/Kiev', )

app.conf.beat_schedule = {
    "every minute": {
        "task": "w_task",  
        "schedule": crontab(minute=0, hour='*/4') 
    }
}

app.autodiscover_tasks()
