import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<bool> validateUser(TextEditingController username,TextEditingController email,TextEditingController password) async{
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
    if(decRes['message']=="Email id is already taken"){
      return false;
    }else{
      return true;
    }
  }else{
    print(decRes['message']);
    return false;
  }
}