import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: bodyPartOfView(),
      )
    );
  }
  Widget bodyPartOfView(){
    return Padding(
      padding: const EdgeInsets.only(left: 50,right: 50),
      child: Column(
        children: [
          const SizedBox(height: 70,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 3), // Offset
                )
              ],
              border: const Border(
                top: BorderSide.none,
                bottom: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide.none
              )
            ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: const TextStyle(fontSize: 16,fontFamily: "Poppins-bold"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                ),

              )
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Popular Job",style: TextStyle(fontSize: 25,fontFamily: "Poppins-bold"),),
              TextButton(
                  onPressed:(){

                  },
                  child: const Text("Show All",style: TextStyle(fontFamily: "Poppins-bold",fontSize: 15,color: Colors.grey),)
              )
            ],
          ),
          popularJobViewer(),
          const SizedBox(height: 30,),
          recentPostJobViewer()
        ],
      ),
    );
  }
  Widget popularJobViewer(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(5, (index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins-bold",
                        color: Colors.red.shade500,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Lead Product Manager",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins-bold",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "\$2500/m",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins-bold",
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "torando canada",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins-bold",
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        )

    );
  }
  Widget recentPostJobViewer(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Recent Post",style: TextStyle(fontSize: 25,fontFamily: "Poppins-bold"),),
            TextButton(
                onPressed:(){

                },
                child: const Text("Show All",style: TextStyle(fontFamily: "Poppins-bold",fontSize: 15,color: Colors.grey),)
            ),
          ],
        ),
        Column(
          children: List.generate(5, (index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("FaceBook",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins-bold",
                        color: Colors.red.shade500,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text("UI/UX designer",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins-bold",
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Full Time",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins-bold",
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 160,),
                        Text("\$4500/m",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins-bold",
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    )
                  ],
                ),
              ),
            );
          })
        )
      ],
    );
  }
}
