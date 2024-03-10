import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobportal/component/view/loginEmployee.dart';

import '../view_model/signupmodel.dart';
import 'login_view.dart';
import 'package:jobportal/component/view/profile_view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username= TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      backgroundColor: Colors.white,
      body: formFieldForSignIn(),
    );
  }
  Widget formFieldForSignIn(){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50),
        child: Column(
          children: [
            const SizedBox(height: 70,),
            const Center(
              child: Text("Create New Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              //color: Colors.white,
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                    hintText: "Email Full Name",
                    hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                    suffixIcon: const Icon(Icons.person)
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "invalid full name";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              //color: Colors.white,
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                    suffixIcon: Icon(Icons.email_outlined)
                ),
                validator: validateEmail,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              //color: Colors.white,
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                    suffixIcon: Icon(Icons.fingerprint)
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value!.isEmpty){
                    return "invalid password";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
                onPressed: () async {
                  //  _submitForm();
                  if(await validateUser(username,email,password)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginEmployeePage()),
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Alert'),
                        content: Text('Enter valid credential , email is already taken'),
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
                child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Popppins-bold'),),
              style: ButtonStyle(
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
  String ? validateEmail(value){
    if(value!.isEmpty){
      return "Please enter the email";
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return "not a valid email";
    }
    return null;
  }
  void _submitForm(){
      bool decider = _formKey.currentState!.validate();
      if(decider == true){
          print("validating");
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("INFORMATION",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  content: Text(
                    "Successfully entered , now you can go to login page using this button :)",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                  ),
                  backgroundColor: Colors.grey,
                  actions: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text("OK",style: TextStyle(color: Colors.white,fontSize: 16),),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                    )
                  ],
                );
              }
          );
      }
      else{

      }
  }
}
