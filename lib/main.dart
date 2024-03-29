
import 'package:flutter/material.dart';
import 'package:jobportal/component/view/create_job.dart';
import 'package:jobportal/component/view/loginUser.dart';
import 'package:jobportal/component/view/profile_employer_view.dart';
import 'package:jobportal/component/view/profile_view.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view/signupUser.dart';

import 'component/view/entry.dart';

void main() {
  Widget myApp = MaterialApp(
    initialRoute: "/entry",
    routes: {
      "/login": (context) => const LoginPage(),
      "/signIn": (context) => const SignInPage(),
      "/search": (context) => const SearchPage(),
      "/profile": (context) => const ProfilePage(),
      "/profileEmployee": (context) => const ProfileEmployeePage(),
      "/createJob": (context) => const CreateJobPage(),
      "/entry" : (context) => const EntryPage()
    },
  );
  runApp(myApp);
}
