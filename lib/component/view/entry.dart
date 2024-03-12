import "package:flutter/material.dart";

import "loginUser.dart";
import "loginEmployee.dart";
class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOB PORTAL",style: TextStyle(fontSize: 20,fontFamily: "Poppins-bold"),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
     // backgroundColor: Colors.grey,
      body: mainButtonForEntry(),
    );
  }

  Widget mainButtonForEntry(){
    return Stack(
      children: [
        Positioned(
          top: 90,
          bottom: 100,
          right: 260,
          left: 30,
          child: MaterialButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
                height: 150,
                width: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/jobSeeker.jpg'),
                        fit: BoxFit.cover
                    )
                ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          bottom: 100,
          right: 30,
          left: 260,
          child: MaterialButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginEmployeePage()),
              );
            },
            child: Container(
              height: 150,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/employee.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
