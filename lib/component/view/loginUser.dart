import 'package:flutter/material.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view/signupUser.dart';
import 'package:jobportal/component/view_model/loginmodel.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


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
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(fontFamily: "Poppins-bold", fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                " Fill the login credential\n to continue!",
                style: TextStyle(fontFamily: "Poppins",fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: username,
            decoration: const InputDecoration(
              hintText: "Enter username or mail",
              hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
              suffixIcon: Icon(Icons.person),
            ),
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
              suffixIcon: Icon(Icons.security),
            ),
          ),
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
            else{
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
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
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
  );
}
