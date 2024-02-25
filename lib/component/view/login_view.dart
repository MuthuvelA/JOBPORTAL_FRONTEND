import 'package:flutter/material.dart';
import 'package:jobportal/component/view/sign-up_view.dart';

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
        title: Text(
          "JOBPORTAL",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins-bold',
          ),
        ),
      ),
      backgroundColor: Colors.pink.shade100,
      body: formFieldForLogin(context),
    );
  }
}

Widget formFieldForLogin(BuildContext context) {
  return Form(
    //key: _formkey,
    child: Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: [
          const SizedBox(height: 150),
          const Center(
              child: Text(
                "Login",
                style: TextStyle(fontFamily: "Poppins", fontSize: 50, fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter username or mail",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 10,
                      )),
                  suffixIcon: const Icon(Icons.person)),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 10,
                      )),
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
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins-Bold',
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
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins-bold",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16.0)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
