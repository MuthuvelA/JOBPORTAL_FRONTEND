import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileViewModel {
  Future<void> saveProfile({
    required String name,
    required String email,
    required String mobile,
    required String address,
    required String currentWork,
    required String selectedSkill,
  }) async {
    var reqBody = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "address": address,
      "currentWork": currentWork,
      "selectedSkill": selectedSkill
    };

    var response = await http.post(
      Uri.parse("http://localhost:3002/userprofile"),
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
