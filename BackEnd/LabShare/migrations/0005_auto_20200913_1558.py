# Generated by Django 3.1 on 2020-09-13 15:58

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LabShare', '0004_userprofile_dob'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='dob',
            field=models.DateField(blank=True, default=datetime.datetime(2020, 9, 13, 15, 58, 19, 642803)),
        ),
    ]