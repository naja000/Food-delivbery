from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class restaurant(models.Model):
    login=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post= models.CharField(max_length=100)
    pincode = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)
    image = models.FileField()
    latitude = models.FloatField()
    longitude = models.FloatField()

class user(models.Model):
    login = models.ForeignKey(login_table, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pincode = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)

class review(models.Model):
    users =models.ForeignKey(user, on_delete=models.CASCADE)
    restaurant =models.ForeignKey(restaurant, on_delete=models.CASCADE)
    review = models.CharField(max_length=100)
    rating = models.FloatField()
    date=models.DateField()

class complaint(models.Model):
    users = models.ForeignKey(user, on_delete=models.CASCADE)
    complaint= models.CharField(max_length=100)
    reply= models.CharField(max_length=100)
    date = models.DateField()

class delivery_agent(models.Model):
    login = models.ForeignKey(login_table, on_delete=models.CASCADE)
    restaurant = models.ForeignKey(restaurant, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pincode = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=100)

class category(models.Model):
    category= models.CharField(max_length=100)
    details= models.CharField(max_length=100)
    restaurant=models.ForeignKey(restaurant, on_delete=models.CASCADE)

class item(models.Model):
    category=models.ForeignKey(category, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    image = models.FileField()
    price=models.IntegerField()
    stock = models.IntegerField()

class order(models.Model):
    user=models.ForeignKey(user,on_delete=models.CASCADE)
    total= models.IntegerField()
    time=models.TimeField()
    date=models.DateField()
    status=models.CharField(max_length=100)

class Assign(models.Model):
    order = models.ForeignKey(order, on_delete=models.CASCADE)
    delivery_agent = models.ForeignKey(delivery_agent, on_delete=models.CASCADE)
    status = models.CharField(max_length=100)
    date = models.DateField()

class order_item(models.Model):
    order = models.ForeignKey(order, on_delete=models.CASCADE)
    item = models.ForeignKey(item, on_delete=models.CASCADE)
    quantity=models.IntegerField()
    status= models.CharField(max_length=100)

class work(models.Model):
    delivery_agent = models.ForeignKey(delivery_agent, on_delete=models.CASCADE)
    status = models.CharField(max_length=100)


class Payment(models.Model):
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    order = models.ForeignKey(order, on_delete=models.CASCADE)
    amount = models.CharField(max_length=100)
    date = models.DateField()


class location(models.Model):
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()


class timeschedule(models.Model):
    user = models.ForeignKey(user, on_delete=models.CASCADE)
    item = models.ForeignKey(item, on_delete=models.CASCADE)
    day = models.CharField(max_length=100)
    type = models.CharField(max_length=100)
    status = models.CharField(max_length=100)

