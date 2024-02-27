import 'package:flutter/material.dart';

class ApplicationTrackerUser extends StatefulWidget {
  const ApplicationTrackerUser({super.key});

  @override
  State<ApplicationTrackerUser> createState() => _ApplicationTrackerUserState();
}

class _ApplicationTrackerUserState extends State<ApplicationTrackerUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Tracker",style: TextStyle(fontSize: 20,fontFamily: "Poppins-bold"),),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: bodyPartForApplicationTracker()),
    );
  }
  Widget bodyPartForApplicationTracker(){
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Text(
                        "GOOGLE",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins-bold",
                          color: Colors.orangeAccent,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Text(
                        "Job Title : Laravel Developer",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins-bold",
                          color: Colors.red.shade500,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Job type : FULL TIME",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins-bold",
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Posted Date : 12/06/2030",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "Poppins-bold",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Application Deadline : FULL TIME",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Poppins-bold",
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Row(
                        children: [
                          Text("STATUS:",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Poppins-bold",
                                color: Colors.green,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                          Text("             developement process")
                        ],
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            );
          }),
        )
    );
  }
}
