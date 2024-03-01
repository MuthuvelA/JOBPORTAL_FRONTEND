import 'package:flutter/material.dart';
import 'package:jobportal/component/view/search_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String ? dropDownValue;
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
              "Name",
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
                ),
              ),
              Container(
                width: 100,
                child: TextField(
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Currently pursuing",
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
          SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
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
