from django.urls import path
from Collegeapp import views


urlpatterns = [

  # add department

  path('add_dept/', views.add_dept),
  path('add_deptpost/', views.add_deptpost),


  # view department
  path('view_dept/', views.dept_view),


  # edit department
  path('edit_dept/<str:idd>', views.edit_dept),
  path('edit_deptpost/', views.edit_deptpost),


  # delete department
  path('delete/<str:did>', views.deleter),


  # add staff
  path('add_staff/', views.add_staff),
  path('add_staffpost/', views.add_staffpost),


  # view staff
  path('view_staff/', views.view_staff),


  # edit staff
  path('edit_staff/<str:did>', views.edit_staff),
  path('edit_staffpost/', views.edit_staffpost),

  # delete staff
  path('deletesd/<str:sd>', views.deletestaff),

  # add course
  path('add_course/', views.addcourse),
  path('add_coursepost/', views.addcoursepost),


  # view course
  path('view_course/', views.viewcourse),


  # edit course
  path('edit_course/<str:pp>', views.editcourse),
  path('edit_coursepost/', views.editcoursepost),


  # delete course
  path('deletec/<str:dc>', views.deletec),


  # sub allocation
  path('sub_allo/', views.suballocation),
  path('sub_allopost/', views.suballocationpost),


  # view suballocation
  path('view_suballocation/', views.viewsuballocation),


  # edit suballocation
  path('edit_sub/<str:did>', views.edit_suballo),
  path('edit_subpost/', views.edit_suballopost),


  # delete suballocation
  path('delete_sub/<str:dii>', views.deletesub),

  # MODULE 2
  # login

  path('login/', views.loginn),
  path('loginnp/', views.loginpost),


  # pages
  path('admin_home/', views.adminpage),
  path('staff_home/', views.staffpage),
  path('std_home/', views.studentpage),


  # VIEW STAFF PROFILE
  path('viewstaff_prof/', views.viewstaffprofile),
  path('staffview_course/', views.view_course),


  # ADD STUDENT
  path('add_student/', views.add_studentt),
  path('add_studentp/', views.add_studentp),

  # VIEW STUDENT
  path('view_std/', views.view_student),
  path('view_appstd/', views.view_approvdstd),

  # EDIT STUDENT
  path('edit_std/<str:kk>', views.edit_student),
  path('edit_stdp/', views.edit_studentp),

  # DELETE STUDENT
  path('deletes/<str:i>', views.deletes),

  # STUDENT ATTENDANCE ADD
  path('stdattndnce/', views.stdattendance),
  path('stdattndncep/', views.stdattendancep),


  # STUDENT ATTENDANCE VIEW
  path('stdattndnceview/', views.studentattndnceview),

  # STUDENT APPROVE/REJECT
  path('approve_reject/', views.app_rej),
  path('approve/<str:pk>', views.approve),
  path('reject/<str:pk>', views.reject),

  # VIEW STUDENT PROFILE
  path('stdprfl/', views.stdprflview),


  # SENT COMPLAINT
  path('sentcom/', views.sentcom),
  path('sentcomp/', views.sentcomp),


  # VIEW COMPLAINT
  path('viewcom/', views.viewcom),


  # SENT REPLY
  path('sentreply/<str:pp>', views.sentreply),
  path('sentreplyp/', views.sentrplyp),


  # VIEW REPLY
  path('viewrep/', views.viewrep),

  # SEARCH COURSE
  path('searchcourse/', views.searchcourse),


  # SEARCH COMPLAINT
  path('srccomp/', views.searchcom),


  # CHANGE PASSWORD STUDENT
  path('changepass_stud/', views.changepass_stud),
  path('changepass_studp/', views.changepass_studp),
]