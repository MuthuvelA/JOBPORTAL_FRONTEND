import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void validateUser(TextEditingController username,TextEditingController email,TextEditingController password) async{
  var reqBody = {
    "username":username.text,
    "email":email.text,
    "password":password.text
  };

  var response = await http.post(Uri.parse("http://localhost:3002/signup"),
      headers: {
        "content-Type":"application/json"
      },
      body: jsonEncode(reqBody)
  );

  var decRes = jsonDecode(response.body);

  if(decRes['status']){
    print(decRes['message']);
  }else{
    print(decRes['message']);
  }
}