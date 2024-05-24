import datetime

from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from django.contrib import auth

from fapp.models import *


def login(request):
    return render(request,'loginnew.html')


def logout(request):
    auth.logout(request)
    return render(request,'loginnew.html')



def loginpost(request):
    username = request.POST['textfield']
    password = request.POST['textfield2']
    try:
        ob = login_table.objects.get(username=username, password=password)
        if ob.type == 'admin':
            ob1=auth.authenticate(username='admin',password='admin')
            if ob1 is not None:
                auth.login(request,ob1)

            return HttpResponse('''<script>alert("Welcome");window.location="/admin_home"</script>''')
        elif ob.type == 'restaurant':
            request.session['lid'] = ob.id
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            return HttpResponse('''<script>alert("login sucsesfully");window.location="/restauranthome"</script>''')
        else:
            return HttpResponse('''<script>alert("invalid data");window.location="/"</script>''')
    except:
        return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')



@login_required(login_url='/')
def admin_home(request):
    return render(request,'admin/adminindex.html')


@login_required(login_url='/')
def verify_restaurant(request):
    ob=restaurant.objects.all()
    return render(request, 'admin/Verify Restaurant.html',{"data":ob})


@login_required(login_url='/')
def acceptrestaurant(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='restaurant'
    ob.save()
    return HttpResponse('''<script>alert("Accepted!!");window.location='/verify_restaurant#about'</script>''')


@login_required(login_url='/')
def rejectrestaurant(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected!!");window.location='/verify_restaurant#about'</script>''')


@login_required(login_url='/')
def verify_restaurantsearch(request):
    s=request.POST['t1']
    ob=restaurant.objects.filter(name__istartswith=s)
    return render(request, 'admin/Verify Restaurant.html',{"data":ob,'n':s})


@login_required(login_url='/')
def verify_users(request):
    ob=user.objects.all()
    return render(request, 'admin/Verify users.html',{"data":ob})


@login_required(login_url='/')
def acceptuser(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='user'
    ob.save()
    return HttpResponse('''<script>alert("Accepted!!");window.location='/verify_users#about'</script>''')


@login_required(login_url='/')
def rejectuser(request,id):
    ob=login_table.objects.get(id=id)
    ob.type='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected!!");window.location='/verify_users#about'</script>''')



@login_required(login_url='/')
def verify_userssearch(request):
    s=request.POST['t1']
    ob=user.objects.filter(name__istartswith=s)
    return render(request, 'admin/Verify users.html',{"data":ob,'n':s})

@login_required(login_url='/')
def send_reply(request,id):
    request.session['rs']=id
    return render(request,'admin/Send Reply.html')


@login_required(login_url='/')
def sendreplypost(request):
    reply=request.POST['textarea']

    ob=complaint.objects.get(id=request.session['rs'])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert("Reply Send");window.location="/view_complaint#about"</script>''')

@login_required(login_url='/')
def view_complaint(request):
    ob=complaint.objects.all()
    return render(request, 'admin/Veiw Complaint.html',{"data":ob})


@login_required(login_url='/')
def view_complaintpost(request):
    s=request.POST['t1']
    ob=complaint.objects.filter(date__icontains=s)
    return render(request, 'admin/Veiw Complaint.html',{"data":ob,'date':s})

@login_required(login_url='/')
def view_review(request):
    ob=review.objects.all()
    return render(request, 'admin/View Reveiw.html',{"data":ob})


@login_required(login_url='/')
def view_reviewpost(request):
    s=request.POST['t1']
    ob=review.objects.filter(date__icontains=s)
    return render(request, 'admin/View Reveiw.html',{"data":ob,'date':s})





#_____________________________RESTAURANT__________________________


@login_required(login_url='/')
def restauranthome(request):
    return render(request,"Restuarant/restaurantindex.html")



@login_required(login_url='/')
def viewshedule(request):
    current_date = datetime.date.today()
    current_date=current_date.strftime("%A")
    print(current_date,"ppppppppppppp")
    ob=timeschedule.objects.filter(day=current_date,item__category__restaurant__login__id=request.session['lid'])

    return render(request,"Restuarant/Veiw scheduleandverify.html",{"data":ob})



@login_required(login_url='/')
def searchschedule(request):
    s=request.POST['textfield']
    current_date = datetime.date.today()
    current_date = current_date.strftime("%A")
    ob=timeschedule.objects.filter(day=current_date,item__category__restaurant__login__id=request.session['lid'],user__pincode=s)
    return render(request, 'restuarant/Veiw scheduleandverify.html',{"data":ob,'date':s})



@login_required(login_url='/')
def acceptschedule(request,id):
    ob=timeschedule.objects.get(id=id)
    ob.status='accept'
    ob.save()
    return HttpResponse('''<script>alert("Accepted!!");window.location='/viewshedule#about'</script>''')

@login_required(login_url='/')
def rejectschedule(request,id):
    ob=timeschedule.objects.get(id=id)
    ob.status='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected!!");window.location='/viewshedule#about'</script>''')





def register_restaurant(request):
    return render(request, 'restuarant/registerindex.html')


def register_restaurantpost(request):
    name=request.POST['name']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    phone=request.POST['phone']
    email=request.POST['email']
    lat=request.POST['lat']
    long=request.POST['long']
    username=request.POST['username']
    password=request.POST['password']
    image=request.FILES['file']
    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)

    ob = login_table()
    ob.username = username
    ob.password = password
    ob.type = 'pending'
    ob.save()

    ob1 = restaurant()
    ob1.name = name
    ob1.place = place
    ob1.post = post
    ob1.pincode = pin
    ob1.email = email
    ob1.phone = phone
    ob1.image = fsave
    ob1.latitude = lat
    ob1.longitude = long
    ob1.login = ob
    ob1.save()
    return HttpResponse('''<script>alert("Registered Successfully!!");window.location="/#about"</script>''')

@login_required(login_url='/')
def managedelivery(request):
    ob=delivery_agent.objects.filter(restaurant__login__id=request.session['lid'])
    return render(request,"Restuarant/Managedeliveryagent.html",{"val":ob})





@login_required(login_url='/')
def agentsearch(request):
    s=request.POST['name']
    ob=delivery_agent.objects.filter(name__istartswith=s)
    return render(request, 'Restuarant/Managedeliveryagent.html',{"val":ob,'n':s})


@login_required(login_url='/')
def adddelivery(request):
    return render(request,"Restuarant/adddeliveryagent.html")

@login_required(login_url='/')
def adddeliverypost(request):
    name=request.POST['name']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    phone=request.POST['phone']
    email=request.POST['email']
    username=request.POST['username']
    password=request.POST['password']

    ob=login_table()
    ob.username=username
    ob.password=password
    ob.type='agent'
    ob.save()

    obj=delivery_agent()
    obj.name=name
    obj.place=place
    obj.post=post
    obj.pincode=pin
    obj.phone=phone
    obj.email=email
    obj.login=ob
    obj.restaurant=restaurant.objects.get(login__id=request.session['lid'])
    obj.save()
    return HttpResponse('''<script>alert("Add Successfully!!");window.location="/managedelivery#about"</script>''')


@login_required(login_url='/')
def editdelivery(request,id):
    ob=delivery_agent.objects.get(id=id)
    request.session['ed']=id
    return render(request,"Restuarant/editdeliveryagent.html",{"val":ob})


@login_required(login_url='/')
def editdeliverypost(request):
    name=request.POST['name']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    phone=request.POST['phone']
    email=request.POST['email']

    obj=delivery_agent.objects.get(id=request.session['ed'])
    obj.name=name
    obj.place=place
    obj.post=post
    obj.pincode=pin
    obj.phone=phone
    obj.email=email
    obj.save()
    return HttpResponse('''<script>alert("Edit Successfully!!");window.location="/managedelivery#about"</script>''')


@login_required(login_url='/')
def deleteagent(request,id):
    res=login_table.objects.get(id=id)
    res.delete()
    return HttpResponse('''<script>alert("Deleted!!!!");window.location="/managedelivery#about";</script>;''')


@login_required(login_url='/')
def manage_category(request):
    ob=category.objects.filter(restaurant__login__id=request.session['lid'])
    return render(request, 'restuarant/Manage category.html',{"data":ob})

@login_required(login_url='/')
def add_category(request):
    return render(request, 'restuarant/Add category.html')


@login_required(login_url='/')
def add_categorypost(request):
    cat=request.POST['textfield']
    details=request.POST['textarea']

    ob=category()
    ob.category=cat
    ob.details=details
    ob.restaurant=restaurant.objects.get(login__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Add Successfully!!");window.location="/manage_category#about"</script>''')

@login_required(login_url='/')
def editcategory(request,id):
    request.session['ec']=id
    ob=category.objects.get(id=id)
    return render(request,"Restuarant/editcategory.html",{"data":ob})

@login_required(login_url='/')
def editcategorypost(request):
    cat=request.POST['textfield']
    details=request.POST['textarea']

    ob=category.objects.get(id=request.session['ec'])
    ob.category=cat
    ob.details=details
    ob.restaurant=restaurant.objects.get(login__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Edit Successfully!!");window.location="/manage_category#about"</script>''')

@login_required(login_url='/')
def deletecategory(request,id):
    res=category.objects.get(id=id)
    res.delete()
    return HttpResponse('''<script>alert("Deleted!!!!");window.location="/manage_category#about";</script>;''')



@login_required(login_url='/')
def add_items(request):
    ob=category.objects.filter(restaurant__login__id=request.session['lid'])
    return render(request, 'restuarant/Add items.html',{"val":ob})


@login_required(login_url='/')
def add_itemspost(request):
    categoryy=request.POST['category']
    name=request.POST['name']
    image=request.FILES['image']
    fs = FileSystemStorage()
    fn = fs.save(image.name, image)
    price = request.POST['price']
    stock = request.POST['stock']

    ob=item()
    ob.name=name
    ob.price=price
    ob.stock=stock
    ob.image=fn
    ob.category=category.objects.get(id=categoryy)
    ob.save()
    return HttpResponse('''<script>alert("Add Items!!!!");window.location="/manage_items#about";</script>;''')



@login_required(login_url='/')
def edititems(request,id):
    ob=category.objects.filter(restaurant__login__id=request.session['lid'])
    ob1=item.objects.get(id=id)
    request.session['ei']=id
    return render(request, 'restuarant/edititem.html',{"val":ob,"val1":ob1})


@login_required(login_url='/')
def edititemspost(request):
    try:
        categoryy=request.POST['category']
        name=request.POST['name']
        image=request.FILES['image']
        fs = FileSystemStorage()
        fn = fs.save(image.name, image)
        price = request.POST['price']
        stock = request.POST['stock']

        ob=item.objects.get(id=request.session['ei'])
        ob.name=name
        ob.price=price
        ob.stock=stock
        ob.image=fn
        ob.category=category.objects.get(id=categoryy)
        ob.save()
        return HttpResponse('''<script>alert("Edit Items!!!!");window.location="/manage_items#about";</script>;''')
    except:
        categoryy = request.POST['category']
        name = request.POST['name']
        price = request.POST['price']
        stock = request.POST['stock']

        ob = item.objects.get(id=request.session['ei'])
        ob.name = name
        ob.price = price
        ob.stock = stock
        ob.category = category.objects.get(id=categoryy)
        ob.save()
        return HttpResponse('''<script>alert("Edit Items!!!!");window.location="/manage_items#about";</script>;''')


@login_required(login_url='/')
def deleteitem(request,id):
    res=item.objects.get(id=id)
    res.delete()
    return HttpResponse('''<script>alert("Deleted!!!!");window.location="/manage_items#about";</script>;''')



@login_required(login_url='/')
def manage_items(request):
    ob1=category.objects.filter(restaurant__login__id=request.session['lid'])
    ob=item.objects.filter(category__restaurant__login__id=request.session['lid'])
    return render(request, 'restuarant/Manage items.html',{'val':ob,'data':ob1})

@login_required(login_url='/')
def itemsearch(request):
    ob1=category.objects.filter(restaurant__login__id=request.session['lid'])
    s=request.POST['select']
    ob=item.objects.filter(category__restaurant__login__id=request.session['lid'],category__id=s)
    return render(request,'restuarant/Manage items.html',{'val':ob,'data':ob1,'t':s})

@login_required(login_url='/')
def assign_agent(request,id):
    request.session['ooid'] = id
    ob = order.objects.get(id=id)
    if ob.status == 'assigned':
        return HttpResponse(
            '''<script>alert("Already Assigned");window.location="/verify_user_orders#about#about";</script>;''')
    else:
        res = delivery_agent.objects.filter(restaurant__login__id=request.session['lid'])

    return render(request, 'restuarant/Assign agent.html',{"data":res})


@login_required(login_url='/')
def assign_agent_post(request):
    name=request.POST['select']
    ob1=order.objects.get(id=request.session['ooid'])
    ob1.status='assigned'
    ob1.save()
    ob=Assign()
    ob.delivery_agent=delivery_agent.objects.get(id=name)
    ob.status='assigned'
    ob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    ob.order=order.objects.get(id=request.session['ooid'])
    ob.save()
    return HttpResponse('''<script>alert("Assigned!!");window.location="/verify_user_orders#about";</script>;''')





@login_required(login_url='/')
def Check_agent_work_status(request):
    ob = order_item.objects.filter(item__category__restaurant__login__id=request.session['lid'])
    print(ob)
    lst = []
    for i in ob:
        res = Assign.objects.filter(order__id=i.order.id)
        for k in res:
            lst.append(k.id)
    res = Assign.objects.filter(id__in=lst)
    return render(request, 'restuarant/Check agent work status.html',{"data":res})

@login_required(login_url='/')
def searchdate(request):
    s=request.POST['textfield']
    ob=Assign.objects.filter(date__icontains=s)
    return render(request, 'restuarant/Check agent work status.html',{"data":ob,'date':s})

@login_required(login_url='/')
def view_items(request,id):
    res=order_item.objects.filter(order__id=id)
    return render(request,'restuarant/Veiw items.html',{"data":res})


@login_required(login_url='/')
def view_user_reviews(request):
    ob=review.objects.filter(restaurant__login__id=request.session['lid'])
    return render(request, 'restuarant/Veiw user reviews.html',{"val":ob})

@login_required(login_url='/')
def searchreview(request):
    s=request.POST['textfield']
    ob=review.objects.filter(date__icontains=s)
    return render(request, 'restuarant/Veiw user reviews.html',{"data":ob,'date':s})


@login_required(login_url='/')
def verify_user_orders(request):
    res = order_item.objects.filter(item__category__restaurant__login__id=request.session['lid'])
    lis = []
    for i in res:
        lis.append(i.order.id)
    res = order.objects.filter(id__in=lis)
    print(res)
    return render(request, 'restuarant/Verify user orders.html',{"data":res})


@login_required(login_url='/')
def searchorder(request):
    s=request.POST['textfield']
    ob=order.objects.filter(date__icontains=s)
    return render(request, 'restuarant/Verify user orders.html',{"data":ob,'date':s})


@login_required(login_url='/')
def acceptorder(request,id):
    ob=order_item.objects.get(id=id)
    ob.status='accept'
    ob.save()
    return HttpResponse('''<script>alert("Accepted!!");window.location='/verify_user_orders#about'</script>''')

@login_required(login_url='/')
def rejectorder(request,id):
    ob=order_item.objects.get(id=id)
    ob.status='reject'
    ob.save()
    return HttpResponse('''<script>alert("Rejected!!");window.location='/verify_user_orders#about'</script>''')




#_____________________________ANDRIOD_______________________________



import json

def logincode(request):
    print(request.POST)
    un = request.POST['uname']
    pwd = request.POST['pswd']
    print(un, pwd)
    try:
        users = login_table.objects.get(username=un, password=pwd)
        print(users,"ooooooooooooooooooooooo")

        if users is None:
            data = {"task": "invalid"}
        else:
            print("in user function")
            data = {"task": "valid", "id": users.id,"type":users.type}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)


def viewworkassigned(request):
    lid = request.POST['lid']
    db=delivery_agent.objects.get(login__id=lid)
    print(db,"dddddd")
    # ob1=location.objects.filter(user__id=uid)
    ob=Assign.objects.filter(delivery_agent__id=db.id)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        ob1=location.objects.get(user__id=i.order.user.id)
        data = {'status':i.status,'date':str(i.date),'user':i.order.user.name,'phone':i.order.user.phone,'oid':i.order.id,'latitude':ob1.latitude,'longitude':ob1.longitude}
        mdata.append(data)
        print(mdata,"lllllllllllllllllllllllllllll")
    r = json.dumps(mdata)
    return HttpResponse(r)



def updatelocation(request):
    lati = float(request.POST['lati'])
    lid = float(request.POST['lid'])
    longi = request.POST['longi']
    ob=location.objects.filter(user__login__id=lid)
    if len(ob) != 0:
            obb=location.objects.get(user__login__id=lid)
            # obb.USER=user_table.objects.get(LOGIN__id=lid)
            obb.latitude=lati
            obb.longitude=longi

            obb.save()

    else:
            obb=location()
            obb.user = user.objects.get(login__id=lid)
            obb.latitude = lati
            obb.longitude = longi
            obb.save()

    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)




def statusupdationofdelivery(request):
    status=request.POST['status']
    lid=request.POST['lid']
    # print(request.POST['status'])
    oid=request.POST['oid']

    lob=Assign.objects.get(order__id=oid)
    lob.status = status
    lob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    print("****************", lid)

    lob.save()

    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)



#_______________________________USERANDROID________________________________




def registration(request):
    name=request.POST['name']
    place=request.POST['place']
    post= request.POST['post']
    pin = request.POST['pin']
    phone = request.POST['phone']
    email = request.POST['email']
    uname = request.POST['username']
    passwd = request.POST['password']
    lob = login_table()
    lob.username = uname
    lob.password = passwd
    lob.type = 'user'
    lob.save()
    userob = user()
    userob.login=lob
    userob.name = name
    userob.place=place
    userob.post = post
    userob.pincode = pin
    userob.phone = phone
    userob.email = email
    userob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def viewrest_search(request):
    s = request.POST['shopname']

    ob=restaurant.objects.filter(login__type = 'restaurant',name__istartswith=s)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {"id":i.id,'name': i.name, 'place': i.place,'post': i.post,'pin': i.pincode, 'phone': i.phone,'email': i.email,'image':str(i.image.url),'latitude':i.latitude,'longitude':i.longitude}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)



def viewrestaurant(request):

    ob=restaurant.objects.all()

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {"id":i.id,'name': i.name, 'place': i.place,'post': i.post,'pin': i.pincode, 'phone': i.phone,'email': i.email,'image':str(i.image.url),'latitude':i.latitude,'longitude':i.longitude}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)


def viewp_search(request):
    s = request.POST['pname']

    sid=request.POST['pid']
    ob=item.objects.filter(category__restaurant__id=sid,name__istartswith=s)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.name, 'image': str(i.image.url), 'price': i.price,'stock': i.stock,'category': i.category.category,'pid':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)


def viewproductdetails(request):
    sid=request.POST['pid']
    ob=item.objects.filter(category__restaurant__id=sid)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.name, 'image': str(i.image.url), 'price': i.price,'stock': i.stock,'category': i.category.category,'pid':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)



def viewschedule(request):
    sid=request.POST['lid']
    ob=timeschedule.objects.filter(user__login__id=sid)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'restaurant':i.item.category.restaurant.name,'food': i.item.name, 'type': i.type, 'day': i.day,'id':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)


def viewsched(request):
    idd=request.POST['sid']
    ob=timeschedule.objects.filter(id=idd)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'food': i.item.name, 'type': i.type, 'day': i.day}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)



def viewschedulestatus(request):
    idd=request.POST['lid']
    ob=timeschedule.objects.filter(user__login__id=idd)

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'food': i.item.name, 'type': i.type, 'day': i.day,'status':i.status}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)








def ratings(request):
    ratingss=request.POST['rating1']
    reviews=request.POST['review']
    lid=request.POST['lid']
    sid=request.POST['sid']
    print(sid,"hj99999999999999h")
    lob=review()
    lob.rating = ratingss
    lob.review = reviews
    lob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    lob.restaurant=restaurant.objects.get(id=sid)
    lob.users=user.objects.get(login__id=lid)
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)








def viewshopsendrating(request):


    ob = restaurant.objects.all()

    print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'restaurant': i.name, 'id': i.id}
        mdata.append(data)

    r = json.dumps(mdata)
    return HttpResponse(r)


def sendcomplaint(request):
    complaints=request.POST['complaint']
    lid=request.POST['lid']
    print(complaint,"gbhnjkhbjn")
    lob=complaint()
    lob.complaint = complaints
    lob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    lob.reply='pending'
    lob.users=user.objects.get(login__id=lid)
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)


def viewreply(request):
    lid=request.POST['lid']
    print(lid,"ooooooooooooooooo")
    print("hbjnklkjh")

    ob=complaint.objects.filter(users__login__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'complaint':i.complaint,'reply':i.reply,'date': str(i.date)}
        mdata.append(data)
        print(mdata)
    r=json.dumps(mdata)
    return HttpResponse(r)



def viewproductdetails1(request):

    ob=order_item.objects.all()

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.item.name, 'image': str(i.item.image),'category':i.item.category.category}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)



def viewitems(request):

    ob=item.objects.all()

    print(ob,"HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'name': i.name,'res':i.category.restaurant.name,'id':i.id}
        mdata.append(data)
        print(mdata)
    r = json.dumps(mdata)
    return HttpResponse(r)




# def vieworderstatus(request):
#     uid=request.POST['lid']
#     ob=order_item.objects.filter(order__user__login__id=uid,status='order')
#     print(ob,"HHHHHHHHHHHHHHH")
#     mdata=[]
#     total=0
#     tt=0
#     for i in ob:
#         data={'restaurant':i.item.category.restaurant.name,'product':i.item.name,'status':i.status,'date': str(i.order.date),'total':total}
#         mdata.append(data)
#         print(mdata)
#     r=json.dumps(mdata)
#     return HttpResponse(r)


# def orders(request):
#     print(request.POST, "=================================")
#     pro_id = request.POST['pid']
#     qty = request.POST['quantity']
#     lid = request.POST['lid']
#     # off = request.POST['offer']
#     print(pro_id, "PPPPPPPPPPPPPPPPPPPPPPP")
#     print(qty, "qqqqqqqqqqqqqqqqqqqqqqq")
#     print(lid, "lllllllllllllllllllllllll")
#
#     ob = item.objects.get(id=pro_id)
#     tt = int(ob.price) * int(qty)
#     stock = ob.stock
#     print(stock, "SSSSSSSSSSSSSSSSSSSSSSSSS")
#     nstk = int(stock) - int(qty)
#     print(nstk, "OOOOOOOOOOOOOOOOOOOO")
#     if str(stock) >= qty:
#         up = item.objects.get(id=pro_id)
#         up.stock = nstk
#         up.save()
#
#         ob = order()
#         ob.user = user.objects.get(login__id=lid)
#         ob.status = 'order'
#         ob.date = datetime.datetime.now()
#         ob.time = datetime.datetime.now()
#         ob.quantity = qty
#         ob.total = tt
#         ob.save()
#
#         obj = order_item()
#         obj.order = ob
#         obj.item = item.objects.get(id=pro_id)
#         obj.quantity = qty
#         obj.status = 'pending'
#
#         obj.save()
#         id = ob.id
#         data = {"task": "valid", "oid": id}
#         r = json.dumps(data)
#         print(r)
#         return HttpResponse(r)
#
#
#     else:
#         data = {"task": "out of stock"}
#         r = json.dumps(data)
#         print(r)
#         return HttpResponse(r)



def vieworderstatus(request):
    uid=request.POST['lid']
    ob=order_item.objects.filter(order__user__login__id=uid).exclude(order__status='cart')
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    total=0
    tt=0
    for i in ob:
        # obf = Offer.objects.filter(PRODUCT__id=i.PRODUCT.id, fromdate__lte=datetime.datetime.today(),
        #                            todate__gte=datetime.datetime.today())
        # print(obf, "+++++++++++=============")
        # tt1=int(i.quantity) * int(i.PRODUCT.price)
        # if len(obf) > 0:
        #     i.OFFER = obf[0].offer
        #     tt1 = tt1- (tt1 * float(obf[0].offer) / 100)
        #     print(tt1,")000000000000000")
        #     total = (int(i.quantity) * int(i.PRODUCT.price)) - int(tt1)
        # else:
        #     i.OFFER = '0'
        #     total = int(i.quantity) * int(i.PRODUCT.price)
        data={'shop':i.item.category.restaurant.name,'product':i.item.name,'status':i.status,'date': str(i.order.date),'total':i.order.total}
        mdata.append(data)
        print(mdata)
    r=json.dumps(mdata)
    return HttpResponse(r)



def orders(request):
    print(request.POST, "=================================")
    pro_id = request.POST['pid']
    qty = request.POST['quantity']
    lid = request.POST['lid']
    # off = request.POST['offer']
    print(pro_id, "PPPPPPPPPPPPPPPPPPPPPPP")
    print(qty, "qqqqqqqqqqqqqqqqqqqqqqq")
    print(lid, "lllllllllllllllllllllllll")

    ob = item.objects.get(id=pro_id)
    tt = int(ob.price) * int(qty)
    stock = ob.stock
    print(stock, "SSSSSSSSSSSSSSSSSSSSSSSSS")
    print(ob.stock, "bbbbbbbbbbbbbbbbbb")

    nstk = int(stock) - int(qty)
    print(nstk, "OOOOOOOOOOOOOOOOOOOO")
    if int(stock) >= int(qty):
        up = item.objects.get(id=pro_id)
        up.stock = nstk
        up.save()

        ob = order()
        ob.user = user.objects.get(login__id=lid)
        ob.status = 'order'
        ob.date = datetime.datetime.now()
        ob.time = datetime.datetime.now()
        ob.total = tt
        ob.save()


        obj = order_item()
        obj.order = ob
        obj.item = item.objects.get(id=pro_id)
        obj.quantity = qty
        obj.status = 'order'


        obj.save()
        id = ob.id
        data = {"task": "valid", "oid": id, "tt": str(tt)}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)





    else:
        data = {"task": "out of stock"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def add_to_cart(request):
    print(request.POST, "=================================")
    pro_id = request.POST['pro_id']
    qty = request.POST['quantity']
    lid = request.POST['lid']
    print(pro_id, "PPPPPPPPPPPPPPPPPPPPPPP")
    print(qty, "qqqqqqqqqqqqqqqqqqqqqqq")
    print(lid, "lllllllllllllllllllllllll")

    ob = item.objects.get(id=pro_id)
    tt = int(ob.price) * int(qty)
    print(tt, "price=====================tt========")
    stock = ob.stock
    print(stock, "SSSSSSSSSSSSSSSSSSSSSSSSS")
    nstk = int(stock) - int(qty)
    print(nstk, "OOOOOOOOOOOOOOOOOOOO")
    if int(stock) >= int(qty):
        up = item.objects.get(id=pro_id)
        up.stock = nstk
        up.save()

        q = order.objects.filter(user__login__id=lid, status='cart')
        if len(q) == 0:

            obe = order()
            obe.total = tt
            obe.status = 'cart'
            obe.date = datetime.datetime.now().strftime("%Y-%m-%d")
            obe.time = datetime.datetime.now()

            obe.user = user.objects.get(login__id=lid)
            obe.save()
            # obf = Offer.objects.filter(PRODUCT__id=up.id, fromdate__lte=datetime.datetime.today(),
            #                            todate__gte=datetime.datetime.today())
            # print(obf, "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII")
            obe1 = order_item()
            obe1.quantity = qty
            obe1.order = obe
            obe1.status = 'order'
            obe1.item = up
            # if len(obf) > 0:
            #     obe1.OFFER = obf[0].offer
            #     tt = tt - (tt * float(obf[0].offer) / 100)
            #     obe.total = tt
            #     print("ooooooooooooooooooooooooo")
            #     obe.save()
            # else:
            #     obe1.OFFER = '0'

            obe1.save()
            data = {"task": "valid"}
            r = json.dumps(data)
            print(r)
            return HttpResponse(r)
        else:
            total = int(ob.price) + int(tt)
            print(total, "KKKKKKKKKKKKKKKK")

            obr = order.objects.get(id=q[0].id)
            # obr. total= total
            # obr.status = 'cart'
            # obr.save()
            obr1 = order_item()
            obr1.quantity = qty
            obr1.order = obr
            obr1.item = up
            obr1.status = 'order'
            # obf = Offer.objects.filter(PRODUCT__id=up.id, fromdate__lte=datetime.datetime.today(),
            #                            todate__gte=datetime.datetime.today())
            # print(obf, "+++++++++++=============")
            # if len(obf) > 0:
            #     obr1.OFFER = obf[0].offer
            #     tt = tt - (tt * float(obf[0].offer) / 100)
            #     total = int(obr.total) + int(tt)
            #     obr.total = total
            #
            #     obr.save()
            # else:
            #     obr1.OFFER = '0'
            #     total = int(obr.total) + int(tt)
            #     print(total, "===========+++++++++++")
            #     obr.total = total
            #
            #     obr.save()
            obr1.save()
            data = {"task": "valid", "tt": str(tt)}

            r = json.dumps(data)
            print(r)
            return HttpResponse(r)

        data = {"task": "valid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



    else:
        data = {"task": "out of stock"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)



def cancel_s_order(request):
    oid=request.POST['oid']
    ob=order_item.objects.get(id=oid)
    p = item.objects.get(id=ob.item.id)
    p.stock=int(p.stock)-int(ob.quantity)
    p.save()
    obb=order.objects.get(id=ob.order.id)
    obb.total=int(obb.total)-(int(ob.quantity)*int(ob.item.price))
    obb.save()
    ob.delete()
    data = {"task": "valid"}
    r = json.dumps(data)


    print(r)
    return HttpResponse(r)



def addschedule(request):
    lid=request.POST['lid']
    fid=request.POST['fid']
    day=request.POST['day']
    type=request.POST['type']

    obb=timeschedule()
    obb.user=user.objects.get(login__id=lid)
    obb.item=item.objects.get(id=fid)
    obb.day=day
    obb.type=type
    obb.status='pending'
    obb.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)


def editschedule(request):
    print(request.POST,"jjjjjjjjjjjjjjj")
    fid=request.POST['fid']
    day=request.POST['day']
    type=request.POST['type']
    sid=request.POST['sid']

    obb=timeschedule.objects.get(id=sid)
    obb.item=item.objects.get(id=fid)
    obb.day=day
    obb.type=type
    obb.save()
    data = {"task": "success"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)




def deleteschedule(request):
    sid=request.POST['sid']

    obb=timeschedule.objects.get(id=sid)
    obb.delete()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)





def payment_sucess(request):
    amount=request.POST['amt']
    lid=request.POST['lid']
    oid=request.POST['orderid']
    lob=Payment()
    lob.user = user.objects.get(login__id=lid)
    lob.date=datetime.datetime.now().strftime("%Y-%m-%d")
    lob.amount=amount
    lob.order=order.objects.get(id=oid)
    lob.save()
    ob=order.objects.get(id=oid)
    ob.status='order'
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)



def viewaddtocart(request):
    lid=request.POST['lid']
    ob=order_item.objects.filter(order__status='CART',order__user__login=lid)
    if len(ob) == 0:
        # return JsonResponse({"total":""})
        data={'total':"0"}
        r=json.dumps(data)
        return HttpResponse(r)
    print(ob,"HHHHHHHHHHHHHHH")
    tamt=0
    mdata = []
    tot=0
    # for i in ob:
    #    tot = int(i.quantity) * int(i.PRODUCT.price)
    #    tamt = int(tamt) + int(tot)
    for i in ob:
        ob1 = order.objects.filter(id=i.order.id)
        # print(ob1,"jjjjjjjjjjjjjjjjjjjjjjjjjjjj")
        data = {'product':i.item.name, 'image':str(i.item.image),'quantity':i.quantity,'price':i.item.price,'pid':i.id,'oid':ob1[0].id,'amt':ob1[0].total}
        mdata.append(data)
        print(mdata)
        # tot = int(i.quantity) * int(i.PRODUCT.price)
        # tamt+= int(i.quantity)*int(i.PRODUCT.price)
    # r = json.dumps(mdata)
        tob=order.objects.get(id=i.order.id)
    tamt=tob.total
    print(tamt,"=======================")
    return JsonResponse({"data":mdata,"total":str(tamt)})


def placeorder(request):
    print(request.POST,"pppppppppppppppppp")
    oid=request.POST['oid']
    # print(oid,"ooooooooooooooo")
    # lid=request.POST['lid']

    lob=order.objects.get(id=oid)

    lob.status = 'order'
    lob.save()
    data = {"task": "valid"}
    r = json.dumps(data)

    print(r)
    return HttpResponse(r)
