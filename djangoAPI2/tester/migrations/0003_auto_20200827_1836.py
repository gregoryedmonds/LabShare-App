# Generated by Django 3.1 on 2020-08-27 18:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tester', '0002_post'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='user',
            options={},
        ),
        migrations.AlterField(
            model_name='user',
            name='name',
            field=models.CharField(max_length=80),
        ),
    ]
