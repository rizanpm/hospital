import random

import datetime
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, HttpResponse, redirect

from hospitalapp.models import *

def login(request):
    return render(request, 'index.html')

def loginp(request):
    var1 = request.POST['email']
    var2 = request.POST['password']

    res = Login.objects.filter(username=var1, password=var2)
    if res.exists():
        obj = Login.objects.get(username=var1, password=var2)
        request.session['lid'] = obj.id

        if obj.type == 'admin':
            return redirect('/hospitalapp/adminhome/')

        elif obj.type == 'doctor':
            return redirect('/hospitalapp/dochome/')

        elif obj.type == 'user':
            return redirect('/hospitalapp/userhom/')

        else:
            return HttpResponse('Invalid username,password')

    else:
        return HttpResponse('Invalid username,password')



def adddep(request):
    return render(request, 'Admin/department.html')

def adddeppost(request):
    name = request.POST['text']

    obj = Department()
    obj.name = name
    obj.save()
    return HttpResponse('ok')


def viewdep(request):
    res=Department.objects.all()
    return render(request, 'Admin/viewdepartment.html', {'data': res})

def editdep(request,id):
    res=Department.objects.get(pk=id)
    return render(request, 'Admin/editdepartment.html',{'data':res})

def editdepP(request):
    name=request.POST['text']
    id=request.POST['id']
    res=Department.objects.filter(pk=id).update(name=name)
    return HttpResponse('ok')

def deletedepartment(request,id):
    res = Department.objects.get(id=id).delete()
    return redirect('/hospitalapp/viewdep/')


def adddoctor(request):
    res=Department.objects.all()
    return render(request, 'Admin/adddoctors.html',{'data':res})

def adddocpost(request):
    name=request.POST['a1']
    gender=request.POST['gender']
    place=request.POST['a2']
    post=request.POST['a3']
    pin=request.POST['a4']
    district=request.POST['a5']
    state=request.POST['a6']
    # DEPARTMENT=request.POST['a7']
    qualification=request.POST['a8']
    dropdown=request.POST['dropdown']
    from datetime import datetime
    photo=request.FILES['pic']
    fs = FileSystemStorage()
    date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date,photo)
    path = fs.url(date)

    lobj=Login()
    lobj.username=name
    lobj.password=pin
    lobj.type='doctor'
    lobj.save()


    obj=Doctor()
    obj.LOGIN_id=lobj.id
    obj.name = name
    obj.gender = gender
    obj.place = place
    obj.post = post
    obj.pin = pin
    obj.district = district
    obj.state = state
    obj.DEPARTMENT_id = dropdown
    obj.qualification = qualification
    obj.photo = path

    obj.save()
    return HttpResponse('ok')


def viewdoctor(request):
    res=Doctor.objects.all()
    return render(request, 'Admin/viewdoctors.html',{'data':res})

def editdoctor(request,id):
    res = Doctor.objects.get(pk=id)
    rez = Department.objects.all()
    return render(request, 'Admin/editprofiledoctor.html', {'data': res,'data1':rez})

def editdoctorP(request):
    Name = request.POST['a1']
    id = request.POST['id']
    Place = request.POST['a2']
    post = request.POST['a3']
    pin = request.POST['a4']
    District = request.POST['a5']
    state = request.POST['a6']
    Departmen = request.POST['dropdown']
    cc=Department.objects.get(pk=Departmen)
    Qualification = request.POST['a8']

    if 'img' in request.FILES:
        image = request.FILES['img']
        if image !="":
            from datetime import datetime
            date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
            fs = FileSystemStorage()
            fs.save(date, image)
            path = fs.url(date)
            obj = Doctor.objects.get(id=id)
            obj.photo = path
            obj.save()

            obj = Doctor.objects.get(id=id)
            obj.name = Name
            obj.place = Place
            obj.post = post
            obj.pin = pin
            obj.district = District
            obj.state = state
            obj.DEPARTMENT = cc
            obj.qualification = Qualification
            obj.save()
            return HttpResponse('ok')
    else:
        obj = Doctor.objects.get(id=id)
        obj.name = Name
        obj.place = Place
        obj.post = post
        obj.pin = pin
        obj.district = District
        obj.state = state
        obj.DEPARTMENT = cc
        obj.qualification = Qualification
        obj.save()
        return HttpResponse('ok')

def deletedoctor(request,id):
    res = Doctor.objects.get(pk=id).delete()
    return redirect('/hospitalapp/viewdoctor/')

def viewpatient(request):
    res=Patient.objects.all()
    return render(request, 'Admin/viewpatient.html',{'data':res})

def viewpatientcomplaint(request):
    res = Complaint.objects.all()
    return render(request, 'Admin/view patient complaint.html',{'data':res})

def sendreply(request,pm):
    res=Complaint.objects.get(id=pm)
    return render(request, 'Admin/sendreply.html',{'data':res})

def sendreplyP(request):
    var1=request.POST['reply']
    replyid=request.POST['replyid']
    obj = Complaint.objects.get(id=str(replyid))
    obj.reply=var1
    obj.status='replied'
    obj.save()
    return HttpResponse('done')


def changepassword(request):
    return render(request, 'Admin/changepassword.html')

def changepasswordP(request):
    var1=request.POST['p1']
    var2=request.POST['p2']
    var3=request.POST['p3']
    res = Login.objects.filter(id=request.session['lid'],password=var1)
    if res.exists():
        if var2 == var3:
            obj = Login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse('''<script>alert("changed");windows.location='/hospitalapp/login/'</script>''')
        else:
            return HttpResponse('''<script>alert("error");windows.location='/hospitalapp/changepassword/'</script>''')

    else:
        return HttpResponse('''<script>alert("error");windows.location='/hospitalapp/changepassword/'</script>''')

def adminhome(request):
    return render(request, 'Admin/adminindex.html')






def viewprofiledoc(request):
    res=Doctor.objects.get(LOGIN=request.session['lid'])
    return render(request, 'doctor/viewprofile.html',{'data':res})

def viewpatientreq(request):
    res=sendrequest.objects.filter(DOCTOR__LOGIN__id=request.session['lid'])
    return render(request, 'doctor/viewpatientreq.html',{'data':res} )

def changepassdoc(request):
    return render(request, 'doctor/changepassdoc.html')

def changepassdocP(request):
    var1 = request.POST['d1']
    var2 = request.POST['d2']
    var3 = request.POST['d3']
    res = Login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = Login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse('''<script>alert("changed");windows.location='/hospitalapp/login/'</script>''')
        else:
            return HttpResponse('''<script>alert("error");windows.location='/hospitalapp/changepassdoc/'</script>''')

    else:
        return HttpResponse('''<script>alert("error");windows.location='/hospitalapp/changepassdoc/'</script>''')


def dochome(request):
    return render(request, 'doctor/doctorindex.html')






def signup(request):
    return render(request, 'user/sign up.html')

def signupP(request):
    Name=request.POST['name']
    Age=request.POST['age']
    Email=request.POST['email']
    Photo=request.FILES['photo']
    Gender=request.POST['gender']
    Place=request.POST['place']
    Post=request.POST['post']
    Pin=request.POST['pin']
    District=request.POST['district']
    from datetime import datetime
    Photo = request.FILES['photo']
    fs = FileSystemStorage()
    date = datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date, Photo)
    path = fs.url(date)


    lobj = Login()
    lobj.username = Name
    lobj.password = Pin
    lobj.type = 'user'
    lobj.save()

    obj = Patient()
    obj.LOGIN_id = lobj.id
    obj.name = Name
    obj.age = Age
    obj.Email = Email
    obj.photo = path
    obj.gender = Gender
    obj.place = Place
    obj.post = Post
    obj.pin = Pin
    obj.district = District

    obj.save()
    return HttpResponse('ok')

def viewprofileuser(request):
    res=Patient.objects.get(LOGIN=request.session['lid'])
    return render(request, 'user/viewprofileuser.html',{'data':res})

def editprofileuser(request,id):
    res=Patient.objects.get(pk=id)
    return render(request,'user/editprofileuser.html',{'data':res})

def editprofileuserP(request):
    Name=request.POST['a1']
    id=request.POST['id']
    Age=request.POST['a2']
    Email=request.POST['a3']
    Gender=request.POST['a4']
    Place=request.POST['a5']
    post=request.POST['a6']
    pin=request.POST['a7']
    district=request.POST['a8']

    if 'img' in request.FILES:
        image = request.FILES['img']
        from datetime import datetime
        date = datetime.now().strftime("%Y%m%d-%H%M%S")+'.jpg'
        fs = FileSystemStorage()
        fs.save(date,image)
        path = fs.url(date)
        obj = Patient.objects.get(id=id)
        obj.photo = path
        obj.save()

    obj = Patient.objects.get(id=id)
    obj.name = Name
    obj.age = Age
    obj.Email = Email
    obj.gender = Gender
    obj.place = Place
    obj.post = post
    obj.pin = pin
    obj.district = district
    obj.save()
    return HttpResponse('ok')


def viewdocreq(request):
    res = Doctor.objects.all()
    return render(request, 'user/viewdocreq.html', {'data':res})


def sendreq(request,did):
    lid=request.session['lid']
    id=Patient.objects.get(LOGIN_id=lid)
    from datetime import datetime
    today=datetime.now().strftime("%Y-%m-%d")

    dd=Doctor.objects.get(id=did)


    obj=sendrequest()
    obj.PATIENT=id
    obj.DOCTOR=dd
    obj.date=today
    obj.status='pending'
    obj.save()
    return HttpResponse('''<script>alert("requested");windows.location='/hospitalapp/sendreq/'</script>''')


def sendcomplaint(request):
    re = Patient.objects.all()
    res = Complaint.objects.all()
    return render(request, 'user/send complaint.html', {'data':re, 'data2':res})

def sendcomplaintP(request):
    var1 = request.POST['complaint']
    from datetime import datetime
    td = datetime.now().strftime('%Y-%m-%d')
    lid = request.session['lid']

    uobj = Patient.objects.get(LOGIN_id=lid)

    obj = Complaint()
    obj.date = td
    obj.complaint = var1
    obj.status = 'pending'
    obj.PATIENT_id = uobj.id
    obj.save()
    return HttpResponse('ok')

def viewreply(request):
    res=Complaint.objects.all()
    return render(request, 'user/viewreply.html', {'data':res})

def userhom(request):
    return render(request, 'user/userindex.html')