import 'package:flutter/material.dart';
import 'package:jobportal/component/view/search_view.dart';
import 'package:jobportal/component/view_model/profileviewModel.dart'; // Import your ProfileViewModel class

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController currentWorkController = TextEditingController();

  String? dropDownValue;
  final List<String> _skillSet = [
    'C',
    'C++',
    'Python',
    'Java',
    'JavaScript',
    'Flutter',
    'Dart',
    'Swift',
    'Kotlin',
    'Ruby',
    'PHP',
  ];

  // Initialize ProfileViewModel
  final ProfileViewModel _profileViewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(fontFamily: "Poppins-bold", fontSize: 20),
        ),
        backgroundColor: Colors.pink.shade500,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Center(child: profilePage()),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                ),
              ),
              Container(
                width: 400,
                child: TextField(
                  controller: nameController,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Id",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                ),
              ),
              Container(
                width: 400,
                child: TextField(
                  controller: emailController,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                ),
              ),
              Container(
                width: 400,
                child: TextField(
                  controller: mobileController,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pincode",
                    style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                  ),
                  Text(
                    "State",
                    style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    child: TextField(
                      controller: pincodeController,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: TextField(
                      controller: stateController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Currently pursuing",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                ),
              ),
              Container(
                width: 400,
                child: TextField(
                  controller: currentWorkController,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add your skill set",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
                ),
              ),
              DropdownButton<String>(
                icon: Icon(Icons.arrow_drop_down_rounded),
                iconSize: 20,
                isExpanded: true,
                value: dropDownValue,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue;
                  });
                },
                items: _skillSet.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _saveProfile(); // Call function to save profile
                },
                child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    _profileViewModel.saveProfile(
      name: nameController.text,
      email: emailController.text,
      mobile: mobileController.text,
      pincode: pincodeController.text,
      state: stateController.text,
      currentWork: currentWorkController.text,
      selectedSkill: dropDownValue,
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
      child: CircleAvatar(
        radius: 75,
      ),
    );
  }
}
