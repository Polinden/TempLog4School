# Generated by Django 3.2.9 on 2021-12-04 17:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project1', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='weather',
            name='temp',
            field=models.FloatField(),
        ),
    ]
