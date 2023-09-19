
from django.contrib import admin
from django.urls import path
from hospitalapp import  views

urlpatterns = [
    path('login/', views.login),
    path('loginp/', views.loginp),
    path('adddep/', views.adddep),
    path('adddeppost/', views.adddeppost),
    path('viewdep/', views.viewdep),
    path('editdep/<str:id>', views.editdep),
    path('editdepP/', views.editdepP),
    path('deletedepartment/<str:id>', views.deletedepartment),
    path('adddoctor/', views.adddoctor),
    path('adddocpost/', views.adddocpost),
    path('viewdoctor/', views.viewdoctor),
    path('editdoctor/<str:id>', views.editdoctor),
    path('editdoctorP/', views.editdoctorP),
    path('deletedoctor/<str:id>', views.deletedoctor),
    path('viewpatient/',views.viewpatient),
    path('viewpatientcomplaint/',views.viewpatientcomplaint),
    path('sendreply/<str:pm>', views.sendreply),
    path('sendreplyP/', views.sendreplyP),
    path('changepassword/', views.changepassword),
    path('changepasswordP/', views.changepasswordP),
    path('adminhome/', views.adminhome),


    path('viewprofiledoc/', views.viewprofiledoc),
    path('viewpatientreq/', views.viewpatientreq),
    path('changepassdoc/', views.changepassdoc),
    path('changepassdocP/', views.changepassdocP),
    path('dochome/', views.dochome),


    path('signup/', views.signup),
    path('signupP/', views.signupP),
    path('viewprofileuser/', views.viewprofileuser),
    path('editprofileuser/<id>', views.editprofileuser),
    path('editprofileuserP/', views.editprofileuserP),
    path('viewdocreq/', views.viewdocreq),
    path('sendreq/<str:did>', views.sendreq),
    path('sendcomplaint/', views.sendcomplaint),
    path('sendcomplaintP/', views.sendcomplaintP),
    path('viewreply/', views.viewreply),
    path('userhom/', views.userhom),
]