
import 'package:flutter/material.dart';
import 'package:jobportal/component/view/create_job.dart';
import 'package:jobportal/component/view/job_list_employee_view.dart';
import 'package:jobportal/component/view/login_view.dart';
import 'package:jobportal/component/view/profile_employer_view.dart';
import 'package:jobportal/component/view/profile_view.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view/sign-up_view.dart';

void main() {
  Widget myApp = MaterialApp(
    initialRoute: "/jobListEmployee",
    routes: {
      "/login": (context) => const LoginPage(),
      "/signIn": (context) => const SignInPage(),
      "/search": (context) => const SearchPage(),
      "/profile": (context) => const ProfilePage(),
      "/profileEmployee": (context) => const ProfileEmployeePage(),
      "/createJob": (context) => const CreateJobPage(),
      "/jobListEmployee" : (context) => const JobListPageForEmployee()
    },
  );
  runApp(myApp);
}
