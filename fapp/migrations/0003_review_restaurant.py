# Generated by Django 4.2.4 on 2023-12-19 07:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('fapp', '0002_order_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='review',
            name='restaurant',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='fapp.restaurant'),
            preserve_default=False,
        ),
    ]
