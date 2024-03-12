import 'package:flutter/material.dart';
import 'package:jobportal/component/view/create_job.dart';
import 'package:jobportal/component/view/profile_employer_view.dart';
import 'package:jobportal/component/view/signupUser.dart';
import 'package:http/http.dart' as http;

import '../view_model/loginmodel.dart';

class LoginEmployeePage extends StatefulWidget {
  const LoginEmployeePage({Key? key}) : super(key: key);

  @override
  State<LoginEmployeePage> createState() => _LoginEmployeePageState();
}

class _LoginEmployeePageState extends State<LoginEmployeePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JOBPORTAL",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins-bold',
          ),
        ),
      ),
      body: formFieldForLogin(context),
    );
  }
}

Widget formFieldForLogin(BuildContext context) {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text(
          "Welcome Back!",
          style: TextStyle(fontFamily: "Poppins-bold", fontSize: 28, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 5),
        const Text(
          "Fill the login credential to continue!",
          style: TextStyle(fontFamily: "Poppins", fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 60),
        TextFormField(
          controller: username,
          decoration: const InputDecoration(
            hintText: "Enter username or mail",
            hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
            suffixIcon: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
            suffixIcon: const Icon(Icons.security_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
              child: const Text(
                'Signup',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Poppins-bold',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            bool isValid = await validateLogin(username, password);
            if (isValid) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateJobPage()),
              );
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Incorrect Password'),
                  content: Text('!!!Enter valid credential!!!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            child: Text(
              "LOG IN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
