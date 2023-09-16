from django.shortcuts import render, redirect
from django.http import HttpResponse
import datetime
from django.core.files.storage import FileSystemStorage
from Collegeapp.models import *
from django.shortcuts import render, get_object_or_404
from .models import complaint
# Create your views here.


# add department

def add_dept(request):
    return render(request, 'add_dept.html')


def add_deptpost(request):
    dept_name = request.POST['dept']
    obj = department()
    obj.depart_name = dept_name
    obj.save()

    return HttpResponse("<script>alert('Success');window.location='/college/add_dept/'</script>")
    # return HttpResponse("success")


# view department

def dept_view(request):
    res = department.objects.all()
    return render(request, 'view_dept.html', {'data': res})


# edit department

def edit_dept(request, idd):
    res = department.objects.get(id=idd)
    return render(request, 'edit_dept.html', {'data': res})


def edit_deptpost(request):
    num1 = request.POST['dept']
    idd = request.POST['id7']
    obj = department.objects.get(id=idd)
    obj.depart_name = num1
    obj.save()

    return HttpResponse("<script>alert('Success');window.location='/college/view_dept/'</script>")


# delete department


def deleter(request, did):
    res = department.objects.get(id=did).delete()
    return redirect('/college/view_dept/')


# add staff

def add_staff(request):
    res = department.objects.all()
    return render(request, 'add_staff.html', {'data': res})


def add_staffpost(request):
    var1 = request.POST['name']
    var2 = request.POST['phone']
    var3 = request.POST['email']
    var4 = request.FILES['photo']
    var5 = request.POST['dob']

    dept = request.POST['dropdown']
    fs = FileSystemStorage()
    date = datetime.datetime.now().strftime("%Y%m%d-%H%M%S") + '.jpg'
    fn = fs.save(date, var4)

    lobj = login()
    lobj.username = var1
    lobj.password = var2
    lobj.usertype = 'staff'
    lobj.save()

    obj = staff()
    obj.staff_name = var1
    obj.phone = var2
    obj.email = var3
    obj.photo = fs.url(date)
    obj.dob = var5

    obj.DEPARTMENT_id = dept
    obj.LOGIN = lobj
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/add_staff/'</script>")


# view staff
def view_staff(request):
    res = staff.objects.all()
    return render(request, 'view_staff.html', {'data': res})


# edit staff
def edit_staff(request, did):
    re = department.objects.all()
    res = staff.objects.get(id=did)
    return render(request, 'edit_staff.html', {'data': res, 'data1': re,'did':did})


def edit_staffpost(request):
    var1 = request.POST['name']
    var2 = request.POST['phone']
    var3 = request.POST['email']

    var5 = request.POST['dob']
    did = request.POST['id9']
    dept = request.POST['dropdown']
    
    obj = staff.objects.get(id=did)
    if 'photo' in request.FILES:
        var4 = request.FILES['photo']
        fs = FileSystemStorage()
        date = datetime.datetime.now().strftime("%Y%m%d-%H%M%S") + 'jpg'
        fn = fs.save(date, var4)
        obj.photo = fs.url(date)

    obj.staff_name = var1
    obj.phone = var2
    obj.email = var3
    obj.dob = var5

    obj.DEPARTMENT_ID = dept

    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/view_staff/'</script>")


# delete staff
def deletestaff(request, sd):
    res = staff.objects.get(id=sd).delete()
    return redirect('/college/view_staff')


# add course
def addcourse(request):
    re = department.objects.all()
    return render(request, 'add_course.html', {'data': re})


def addcoursepost(request):
    var1 = request.POST['dropdown']
    var2 = request.POST['course']

    obj = course()
    obj.DEPT_id = var1
    obj.coursename = var2
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/add_course/'</script>")


# view course

def viewcourse(request):
    res = course.objects.all()
    return render(request, 'viewcourse.html', {'data': res})


# SEARCH COURSE

def searchcourse(request):
    search = request.POST['search']
    res = course.objects.filter(coursename__contains=search)
    return render(request, 'viewcourse.html', {'data': res})


# edit course

def editcourse(request, pp):
    re = department.objects.all()
    res = course.objects.get(id=pp)
    return render(request, 'edit_course.html', {'data': re, 'data1': res})


def editcoursepost(request):
    var1 = request.POST['dropdown']
    var2 = request.POST['course']
    pp = request.POST['id4']
    obj = course.objects.get(id=pp)

    obj.DEPT_id = var1
    obj.coursename = var2
    obj.save()

    return HttpResponse("<script>alert('Success');window.location='/college/view_course/'</script>")


# delete course

def deletec(request, dc):
    res = course.objects.get(id=dc).delete()
    return redirect('/college/view_course/')


# staff allocation

def suballocation(request):
    res = department.objects.all()
    re = staff.objects.all()
    return render(request, 'staff_allocation.html', {'data': res, 'data2': re})


def suballocationpost(request):
    var1 = request.POST['drpst']
    var2 = request.POST['drpdt']

    obj = sub_allocation()
    obj.STAFF_id = var1
    obj.DEP_id = var2
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/sub_allo/'</script>")


# view sub allocation

def viewsuballocation(request):
    res = sub_allocation.objects.all()
    return render(request, 'view_suballo.html', {'data': res})


# edit suballocation

def edit_suballo(request, did):
    res = sub_allocation.objects.get(id=did)
    re = department.objects.all()
    ree = staff.objects.all()
    return render(request, 'edit_suballocation.html', {'data': res, 'data1': re, 'data2': ree})


def edit_suballopost(request):
    var1 = request.POST['drpdt']
    var2 = request.POST['drpst']
    did = request.POST['id3']

    obj = sub_allocation.objects.get(id=did)
    obj.DEP_id = var1
    obj.STAFF_id = var2
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/view_suballocation/'</script>")


def deletesub(request, dii):
    res = sub_allocation.objects.get(id=dii).delete()
    return redirect('/college/view_suballocation/')


# login

def loginn(request):
    return render(request, 'log index.html')


def loginpost(request):
    var1 = request.POST['username']
    var2 = request.POST['pass']

    res = login.objects.filter(username=var1, password=var2)

    if res.exists():
        obj = login.objects.get(username=var1, password=var2)
        request.session['lid'] = obj.id

        if obj.usertype == 'admin':
            return redirect('/college/admin_home/')

        elif obj.usertype == 'staff':
            return redirect('/college/staff_home/')

        elif obj.usertype == 'student':
            return redirect('/college/std_home/')

        else:
            return HttpResponse('ok')
    else:
        return HttpResponse('no user found')


# pages

def adminpage(request):
    return render(request, 'admin_homepage.html')


def staffpage(request):
    return render(request, 'staff_index.html')


def studentpage(request):
    return render(request, 'student_index.html')


# MODULE 2 STAFF

# STAFF PROFILE VIEW

def viewstaffprofile(request):
    res = staff.objects.get(LOGIN_id=request.session['lid'])
    return render(request, 'staff_profileview.html', {'data': res})


# STAFF COURSE VIEW
def view_course(request):
    res = course.objects.all()
    return render(request, 'staffcourse_view.html', {'data': res})


# ADD STUDENT

def add_studentt(request):
    re = course.objects.all()
    return render(request, 'student_reg.html', {'data8': re})


def add_studentp(request):
    var1 = request.POST['name']
    var2 = request.POST['email']
    var3 = request.POST['phone']
    var4 = request.POST['dob']

    std = request.POST['dropdown1']
    lobj = login()
    lobj.username = var1
    lobj.password = var3
    lobj.usertype = 'student'
    lobj.save()

    obj = add_student()
    obj.name = var1
    obj.email = var2
    obj.phone = var3
    obj.dob = var4
    obj.COURSE_id = std
    obj.LOGIN_id = lobj.id
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/add_student/'</script>")


# VIEW STUDENT

def view_student(request):
    res = add_student.objects.filter(status="Pending")
    return render(request, 'view_student.html', {'data6': res})


def view_approvdstd(request):
    res = add_student.objects.filter(status="Approved")
    return render(request, 'view_approvdstd.html', {'data2': res})


# EDIT STUDENT

def edit_student(request, kk):
    res = add_student.objects.get(id=kk)
    re = course.objects.all()
    return render(request, 'edit_student.html', {'res': res, 'res1': re})


def edit_studentp(request):

    var1 = request.POST['name']
    var2 = request.POST['email']
    var3 = request.POST['phone']
    var4 = request.POST['dob']

    kk = request.POST['zen']

    rep = request.POST['dropdown88']

    obj = add_student.objects.get(id=kk)
    obj.name = var1
    obj.email = var2
    obj.phone = var3
    obj.dob = var4
    obj.COURSE_id = rep

    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/view_std/'</script>")


# DELETE STUDENT

def deletes(request, i):
    res = add_student.objects.get(id=i).delete()
    return redirect('/college/stdprfl/', {'data': res})


# STUDENT ATTENDANCE ADD(PRESENT/ABSENT)

def stdattendance(request):
        res = attendance.objects.all()
        re = add_student.objects.all()
        return render(request, 'studentattndnceadd.html', {'data': res, 'data1': re})


def stdattendancep(request):
    ssd = request.POST['dropdown']
    var1 = request.POST['status']
    var2 = request.POST['date']

    obj = attendance()
    obj.STUDENT_id = ssd
    obj.status = var1
    obj.date = var2
    from datetime import datetime
    today = datetime.now().strftime("%Y-%m-%d")
    obj.date = today
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/stdattndnce/'</script>")


# STUDENT ATTENDANCE VIEW

def studentattndnceview(request):
    res = attendance.objects.all()
    return render(request, 'Stdattndnceview.html', {'data': res})


# APPROVE/REJECT STUDENT
def app_rej(request):
    res = add_student.objects.all()
    return render(request, 'approve_reject.html', {'data': res})


def approve(request, pk):
    res = add_student.objects.filter(pk=pk).update(status = 'Approved')
    return HttpResponse("<script>alert('Approved');window.location='/college/staff_home/'</script>")


def reject(request, pk):
    res = add_student.objects.filter(pk=pk).update(status = 'Rejected')
    return HttpResponse("<script>alert('Rejected');window.location='/college/staff_home/'</script>")


# VIEW STUDENT PROFILE
def stdprflview(request):
    res = add_student.objects.filter(LOGIN_id=request.session['lid'])
    return render(request, 'viewstd_profile.html', {'data': res})


# SENT COMPLAINT
def sentcom(request):
    re = add_student.objects.all()
    res = complaint.objects.all()
    return render(request, 'sent_complaint.html', {'data': re, 'data2': res })


def sentcomp(request):
    var1 = request.POST['complaint']
    from datetime import datetime
    td = datetime.now().strftime('%Y-%m-%d')
    lid = request.session['lid']

    sobj = add_student.objects.get(LOGIN_id=lid)

    obj = complaint()
    obj.date = td
    obj.complaint = var1
    obj.status = 'pending'
    obj.STUDENT_id_id = sobj.id
    obj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/sentcom/'</script>")


# VIEW COMPLAINT

def viewcom(request):
    res = complaint.objects.all()
    return render(request, 'view_complaint.html', {'dataa': res})


# SEARCH COMPLAINT

def searchcom(request):
    fdate = request.POST['search1']
    tdate = request.POST['search2']
    res = complaint.objects.filter(date__range=[fdate, tdate])
    return render(request, 'view_complaint.html', {'dataa': res})


# SENT REPLY

def sentreply(request, pp):
    res = complaint.objects.get(id=pp)
    return render(request, 'sent_reply.html', {'data': res})


def sentrplyp(request):
    var1 = request.POST['reply']
    comid = request.POST['comid']

    cobj = complaint.objects.get(id=str(comid))
    cobj.reply = var1
    cobj.status = 'replied'
    cobj.save()
    return HttpResponse("<script>alert('Success');window.location='/college/admin_home/'</script>")


# VIEW REPLY

def viewrep(request):
    res = complaint.objects.all()
    return render(request, 'view_reply.html', {'data': res})

# CHANGE PASSWORD STUDENT


def changepass_stud(request):
    return render(request, 'changepass_stud.html')


def changepass_studp(request):
    var1 = request.POST['cpass']
    var2 = request.POST['npass']
    var3 = request.POST['cnpass']
    res = login.objects.filter(id=request.session['lid'], password=var1)
    if res.exists():
        if var2 == var3:
            obj = login.objects.filter(id=request.session['lid']).update(password=var2)
            return HttpResponse("<script>alert('changed');window.location='/college/login/'</script>")
        else:
            return HttpResponse("<script>alert('error');window.location='/college/changepass_stud/'</script>")
    else:
        return HttpResponse("<script>alert('error');window.location='/college/changepass_stud/'</script>")





