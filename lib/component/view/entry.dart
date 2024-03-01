import "package:flutter/material.dart";

import "loginUser.dart";

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
      backgroundColor: Colors.grey,
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
            child: Image.network(
                'https://th.bing.com/th/id/OIP.e1KNYwnuhNwNj7_-98yTRwHaF7?rs=1&pid=ImgDetMain',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
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
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Image.network(
              'https://th.bing.com/th/id/OIP.GBjqNOdFKYK0He2NZcozeAHaFG?rs=1&pid=ImgDetMain',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
