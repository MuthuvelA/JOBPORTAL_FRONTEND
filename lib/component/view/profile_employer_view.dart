import 'package:flutter/material.dart';

class ProfileEmployeePage extends StatefulWidget {
  const ProfileEmployeePage({super.key});

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
          textField("Company Name",companyNameController),
          SizedBox(height: 20,),
          textField("Employee Name",companyNameController),
          SizedBox(height: 20,),
          textField("Email ID",emailIdController),
          SizedBox(height: 20,),
          textField("Mobile",mobileController),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: companyAddressController,
              decoration: InputDecoration(
                hintText: "Company Address",
                hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.blue, width: 2
                    )
                ),
              ),
              maxLines: 3,
              // controller: mobileController,
            ),
          ),
          SizedBox(height: 20,),
          textField("Designation",designationController),
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
      child: const CircleAvatar(
        radius: 75,
      ),
    );
  }

  Widget textField(String hint,TextEditingController controller){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontFamily: "Poppins-bold", fontWeight: FontWeight.w700),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.blue, width: 2
              )
          ),
        ),
        controller: controller,
      ),
    );
  }
}
