from django.db import models
from django.conf import settings

class City(models.Model):
    name = models.CharField(max_length=100)

class Weather(models.Model):
    updated = models.DateTimeField(auto_now=True)
    temp = models.FloatField()
    city = models.ForeignKey(
        City,
        on_delete=models.CASCADE,
        null=True
    )
   
class UserCity(models.Model):
     user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE
     )
     city = models.ForeignKey(
        City,
        on_delete=models.CASCADE
     )


