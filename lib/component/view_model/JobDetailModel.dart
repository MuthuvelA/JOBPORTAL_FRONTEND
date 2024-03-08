import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JobDetailModel {
  Future<void> saveJobPost({
    required String companyName,
    required String companyWebsite,
    required String jobTitle,
    required String jobCategory,
    required String jobType,
    required String companyLocation,
    required String salaryRange,
    required String experience,
    required String qualification,
    required String applicationDeadline,
    required String jobApplicationLink,
    required String jobDescription,
  }) async {
    var reqBody = {
      "companyName": companyName,
      "companyWebsite": companyWebsite,
      "jobTitle": jobTitle,
      "jobCategory": jobCategory,
      "jobType": jobType,
      "companyLocation": companyLocation,
      "salaryRange": salaryRange,
      "experience": experience,
      "qualification": qualification,
      "applicationDeadline": applicationDeadline,
      "jobApplicationLink": jobApplicationLink,
      "jobDescription": jobDescription
    };

    var response = await http.post(
      Uri.parse("http://localhost:3002/jobpost"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(reqBody),
    );

    var decRes = jsonDecode(response.body);
    if (decRes['status']) {
      print(decRes['message']);
    } else {
      print(decRes['message']); // Error message
    }
  }
}
