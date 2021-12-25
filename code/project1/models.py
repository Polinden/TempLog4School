from django.db import models

class Weather(models.Model):
    updated = models.DateTimeField(auto_now=True)
    temp = models.FloatField()

