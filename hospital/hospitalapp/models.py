from django.db import models

class Login(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    type = models.CharField(max_length=100)

class Department(models.Model):
    name = models.CharField(max_length=100)

class Doctor(models.Model):
    LOGIN = models.ForeignKey(Login,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pin = models.CharField(max_length=100)
    district = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    DEPARTMENT = models.ForeignKey(Department,on_delete=models.CASCADE)
    qualification = models.CharField(max_length=100)
    photo = models.CharField(max_length=300)

class Patient(models.Model):
    LOGIN = models.ForeignKey(Login,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    age = models.CharField(max_length=100)
    Email = models.CharField(max_length=100)
    photo = models.CharField(max_length=500)
    gender = models.CharField(max_length=100)
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    pin = models.CharField(max_length=100)
    district = models.CharField(max_length=100)

class Complaint(models.Model):
    PATIENT = models.ForeignKey(Patient,on_delete=models.CASCADE)
    complaint = models.CharField(max_length=100)
    reply = models.CharField(max_length=100)
    date = models.CharField(max_length=100)
    status = models.CharField(max_length=100)

class sendrequest(models.Model):
    PATIENT = models.ForeignKey(Patient,on_delete=models.CASCADE)
    DOCTOR = models.ForeignKey(Doctor,on_delete=models.CASCADE)
    date = models.CharField(max_length=100)
    status = models.CharField(max_length=100,default=1)


