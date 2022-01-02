from django.db import models
from django.conf import settings

class Weather(models.Model):
    updated = models.DateTimeField(auto_now=True)
    temp = models.FloatField()

class City(models.Model):
    name = models.CharField(max_length=100)

class UserSity(models.Model):
     user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE
     )

     city = models.OneToOneField(
        City,
        on_delete=models.CASCADE
     )


