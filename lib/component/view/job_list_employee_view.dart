import 'package:flutter/material.dart';

class JobListPageForEmployee extends StatefulWidget {
  const JobListPageForEmployee({super.key});

  @override
  State<JobListPageForEmployee> createState() => _JobListPageForEmployeeState();
}

class _JobListPageForEmployeeState extends State<JobListPageForEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Job List",style: TextStyle(fontSize: 20,fontFamily: "Poppins-bold"),),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
      child: bodyPartForJobList()
      ),
      ),
    );
  }

  Widget bodyPartForJobList(){
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
                    Text(
                      "Job Title : Laravel Developer",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins-bold",
                        color: Colors.red.shade500,
                      ),
                    ),
                    const SizedBox(height: 30,),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: (){

                            },
                            child: const Icon(Icons.remove_red_eye_outlined,color: Colors.green,size: 15,)
                        ),
                        TextButton(
                            onPressed: (){

                            },
                            child: const Icon(Icons.edit,color: Colors.blue,size: 15,)
                        ),
                        TextButton(
                            onPressed: (){

                            },
                            child: const Icon(Icons.delete_outline,color: Colors.red,size: 15,)
                        ),
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
