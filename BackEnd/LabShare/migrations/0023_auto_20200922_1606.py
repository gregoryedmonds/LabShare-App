# Generated by Django 3.1 on 2020-09-22 16:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('LabShare', '0022_auto_20200922_1351'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='dob',
            field=models.DateField(blank=True, default='2000/01/01'),
        ),
    ]