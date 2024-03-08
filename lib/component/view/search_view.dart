import 'package:flutter/material.dart';
import 'package:jobportal/component/view_model/jobsearchModel.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RecentPost> recentPosts = []; // List to hold recent posts

  @override
  void initState() {
    super.initState();
    // Fetch recent posts when the page initializes
    fetchRecentPosts();
  }

  // Function to fetch recent posts
  void fetchRecentPosts() {
    // Placeholder data (remove this when integrating with backend)
    List<RecentPost> placeholderPosts = [
      RecentPost(
        companyName: 'Facebook',
        position: 'UI/UX Designer',
        employmentType: 'Full Time',
        salary: '\$4500/m',
      ),
      RecentPost(
        companyName: 'Google',
        position: 'Product Manager',
        employmentType: 'Part Time',
        salary: '\$3500/m',
      ),
    ];

    setState(() {
      recentPosts = placeholderPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: TextStyle(fontSize: 25, fontFamily: "Poppins-bold"),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: bodyPartOfView(),
      ),
    );
  }

  Widget bodyPartOfView() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
              border: const Border(
                top: BorderSide.none,
                bottom: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide.none,
              ),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          recentPostViewer(), // Show recent posts
        ],
      ),
    );
  }

  Widget recentPostViewer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Post",
          style: TextStyle(fontSize: 25, fontFamily: "Poppins-bold"),
        ),
        const SizedBox(height: 10),
        // Show recent posts fetched from the backend
        Column(
          children: recentPosts.map((post) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.companyName,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins-bold",
                        color: Colors.red.shade500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      post.position,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins-bold",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.employmentType,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins-bold",
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          post.salary,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Poppins-bold",
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}