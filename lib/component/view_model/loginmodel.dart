import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobportal/component/view/loginUser.dart';

Future<bool> validateLogin(TextEditingController username, TextEditingController password) async {
  var reqBody = {
    "username": username.text,
    "password": password.text,
  };

  var response = await http.post(
    Uri.parse("http://localhost:3002/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  if (decRes['status']) {
    print(decRes['message']);
    return true;
  } else {
    print(decRes['message']);
    return false;
  }
}
