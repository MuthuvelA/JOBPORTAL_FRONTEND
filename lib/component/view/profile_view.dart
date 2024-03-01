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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter mobile",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                  controller: mobileController,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Address",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                  maxLines: 3,
                  controller: mobileController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Currency pursuing",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                  controller: mobileController,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add your skills",
                    hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.blue, width: 2
                        )
                    ),
                  ),
                  maxLines: 3,
                  //controller: mobileController,
                ),
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
