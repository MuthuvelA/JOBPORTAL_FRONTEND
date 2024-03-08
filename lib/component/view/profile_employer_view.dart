import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobportal/component/view/create_job.dart';
import 'package:jobportal/component/view_model/employeedetailModel.dart';

class ProfileEmployeePage extends StatefulWidget {
  const ProfileEmployeePage({Key? key}) : super(key: key);

  @override
  State<ProfileEmployeePage> createState() => _ProfileEmployeePageState();
}

class _ProfileEmployeePageState extends State<ProfileEmployeePage> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(fontFamily: "Poppins-bold", fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: bodyPartOfProfile(),
      ),
    );
  }

  Widget bodyPartOfProfile() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: [
          Center(child: profilePage()),
          SizedBox(height: 30),
          textField("Company Name", companyNameController),
          SizedBox(height: 20),
          textField("Employee Name", employeeNameController),
          SizedBox(height: 20),
          textField("Email ID", emailIdController),
          SizedBox(height: 20),
          textField("Mobile", mobileController),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: companyAddressController,
              decoration: InputDecoration(
                hintText: "Company Address",
                hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20),
          textField("Designation", designationController),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              saveEmployeeProfile();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateJobPage()),
              );
            },
            child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 16.0)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profilePage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white54,
          width: 3,
        ),
      ),
      child: const CircleAvatar(
        radius: 75,
      ),
    );
  }

  Widget textField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        controller: controller,
      ),
    );
  }

  void saveEmployeeProfile() {
    EmployeeDetailModel().saveEmployeeProfile(
      companyName: companyNameController.text,
      employeeName: employeeNameController.text,
      employerMail: emailIdController.text,
      employeeMobile: mobileController.text,
      companyAddress: companyAddressController.text,
      employerDesignation: designationController.text,
    );
  }
}
