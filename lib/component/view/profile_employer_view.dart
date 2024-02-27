import 'package:flutter/material.dart';

class ProfileEmployeePage extends StatefulWidget {
  const ProfileEmployeePage({super.key});

  @override
  State<ProfileEmployeePage> createState() => _ProfileEmployeePageState();
}

class _ProfileEmployeePageState extends State<ProfileEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE",style: TextStyle(fontFamily: "Poppins-bold",fontSize: 20),),
        backgroundColor: Colors.pink.shade500,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: bodyPartOfProfile()
      ),
    );
  }
  Widget bodyPartOfProfile(){
    return Padding(
      padding: const EdgeInsets.only(left: 50,right: 50),
      child: Column(
        children: [
          Center(child: profilePage()),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Company Name",
              style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
            ),
          ),
          Container(
            width:400,
            child: TextField(
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Employee Name",
              style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
            ),
          ),
          Container(
            width: 400,
            child: TextField(
            ),
          ),
          SizedBox(height: 20,),
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
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Mobile",
              style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
            ),
          ),
          Container(
            width:400,
            child: TextField(
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Company Adress",
              style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
            ),
          ),
          Container(
            width:400,
            child: TextField(
              maxLines: 3,
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Designation",
              style: TextStyle(fontSize: 17, fontFamily: "Poppins-bold"),
            ),
          ),
          Container(
            width:400,
            child: TextField(
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {},
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
    );
  }
  Widget profilePage(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white54,  // Change the border color as needed
          width: 3,  // Adjust the border width as needed
        ),
      ),
      child: CircleAvatar(
        radius: 75,
      ),
    );
  }
}
