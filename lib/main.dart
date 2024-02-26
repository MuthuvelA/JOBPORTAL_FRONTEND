
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jobportal/component/view/login_view.dart';
import 'package:jobportal/component/view/profile_view.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view/sign-up_view.dart';

void main() {
  Widget MyApp = MaterialApp(
    initialRoute: "/profile",
    routes: {
      "/login" : (context) => const LoginPage(),
      "/signIn" : (context) => const SignInPage(),
      "/search" : (context) => const SearchPage(),
      "/profile" : (context) => const ProfilePage()
     },
  );
  runApp(MyApp);
}