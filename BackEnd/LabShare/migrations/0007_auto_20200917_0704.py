# Generated by Django 3.1 on 2020-09-17 07:04

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LabShare', '0006_auto_20200917_0537'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='bio',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='dob',
            field=models.DateField(blank=True, default=datetime.datetime(2020, 9, 17, 7, 4, 59, 329134), null=True),
        ),
    ]