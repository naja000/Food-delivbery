# Generated by Django 4.2.4 on 2023-12-19 05:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='status',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
