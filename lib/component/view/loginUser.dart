  import 'package:flutter/material.dart';
import 'package:jobportal/component/view/profile_view.dart';
import 'package:jobportal/component/view/search_view.dart';
  import 'package:jobportal/component/view/signupUser.dart';
  import 'package:jobportal/component/view_model/loginmodel.dart';

  import 'package:http/http.dart' as http;


  import '../view_model/loginmodel.dart';
  class LoginPage extends StatefulWidget {
    const LoginPage({Key? key}) : super(key: key);

    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
    GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
    TextEditingController username=TextEditingController();
    TextEditingController password=TextEditingController();
    return Form(
      //key: _formkey,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                      "Welcome Back!",
                      style: TextStyle(fontFamily: "Poppins-bold", fontSize: 28, fontWeight: FontWeight.w800),
                    ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  " Fill the login credential\n to continue!",
                  style: TextStyle(fontFamily: "Poppins",fontSize: 15,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 60,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextFormField(
                controller:username,
                decoration: const InputDecoration(
                    hintText: "Enter username or mail",
                    hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                    suffixIcon: Icon(Icons.person)),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                    suffixIcon: const Icon(Icons.fingerprint)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins-bold',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),
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
                        fontFamily: 'Poppins-bold'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool isValid = await validateLogin(username, password);
                if(isValid){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                  }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10), // Adjust horizontal padding here
                child: const Text(
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
      ),

    );

  }

