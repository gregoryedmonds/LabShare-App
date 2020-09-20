# Generated by Django 3.1.1 on 2020-09-20 16:11

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LabShare', '0022_auto_20200920_1602'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userprofile',
            name='image',
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='bio',
            field=models.TextField(blank=True, default=''),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='dob',
            field=models.DateField(blank=True, default=datetime.datetime(2020, 9, 20, 16, 11, 6, 418358)),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='employer',
            field=models.TextField(blank=True, default=''),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='occupation',
            field=models.TextField(blank=True, default=''),
        ),
    ]
