import 'dart:convert';
import 'package:http/http.dart' as http;

class EmployeeDetailModel {
  Future<void> saveEmployeeProfile({
    required String companyName,
    required String employeeName,
    required String employerMail,
    required String employeeMobile,
    required String companyAddress,
    required String employerDesignation,
  }) async {
    var reqBody = {
      "companyname": companyName,
      "employername": employeeName,
      "employermail": employerMail,
      "employermobile": employeeMobile,
      "companyaddress": companyAddress,
      "employeedesignation": employerDesignation
    };

    var response = await http.post(
      Uri.parse("http://localhost:3002/employeeprofile"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(reqBody),
    );

    var decRes = jsonDecode(response.body);

    if (decRes['status']) {
      print(decRes['message']); // Success message
    } else {
      print(decRes['message']); // Error message
    }
  }
}
