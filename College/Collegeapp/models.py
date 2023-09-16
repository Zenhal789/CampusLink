from django.db import models

# Create your models here.

# add department


class department(models.Model):
    depart_name = models.CharField(max_length=100, default="")


# login

class login(models.Model):
    username = models.CharField(max_length=100, default="")
    password = models.CharField(max_length=100, default="")
    usertype = models.CharField(max_length=100, default="")


# add staff

class staff(models.Model):
    staff_name = models.CharField(max_length=100, default="")
    phone = models.CharField(max_length=100, default="")
    email = models.CharField(max_length=100, default="")
    photo = models.FileField(max_length=100, default="")
    dob = models.CharField(max_length=100, default="")
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default=1)
    DEPARTMENT = models.ForeignKey(department, on_delete=models.CASCADE, default=3)


# add course

class course(models.Model):
    coursename = models.CharField(max_length=100, default="")
    DEPT = models.ForeignKey(department, on_delete=models.CASCADE, default=1)


# sub allocation


class sub_allocation(models.Model):
    STAFF = models.ForeignKey(staff, on_delete=models.CASCADE, default=1)
    DEP = models.ForeignKey(department, on_delete=models.CASCADE, default=2)


# add student

class add_student(models.Model):
    name = models.CharField(max_length=100, default="")
    email = models.CharField(max_length=100, default="")
    phone = models.CharField(max_length=100, default="")
    dob = models.CharField(max_length=100, default="")
    COURSE = models.ForeignKey(course, on_delete=models.CASCADE, default=3)
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default=4)
    status = models.CharField(max_length=100, default="pending")


# STUDENT ATTENDANCE
class attendance(models.Model):
    STUDENT = models.ForeignKey(add_student, on_delete=models.CASCADE, default=1)
    status = models.CharField(max_length=100, default="")
    date = models.CharField(max_length=100, default="")


# SENT COMPLAINT
class complaint(models.Model):
    STUDENT_id = models.ForeignKey(add_student, on_delete=models.CASCADE, default=2)
    date = models.DateField(max_length=100, default="2023-05-01")
    complaint = models.CharField(max_length=100, default="")
    status = models.CharField(max_length=100, default="")
    reply = models.CharField(max_length=100, default="")
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default=2)
