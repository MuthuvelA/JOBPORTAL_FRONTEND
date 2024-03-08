import 'package:flutter/material.dart';
import 'package:jobportal/component/view_model/jobsearchModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<JobSearchResult> recentPosts = [];

  @override
  void initState() {
    super.initState();
    // Fetch recent posts when the page initializes
    fetchRecentPosts();
  }

  // Function to fetch recent posts
  void fetchRecentPosts() {
    JobSearchModel().searchJobs('recent').then((posts) {
      setState(() {
        // Limit the number of recent posts to 2
        recentPosts = posts.take(2).toList();
      });
    }).catchError((error) {
      print("Error fetching recent posts: $error");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: TextStyle(fontSize: 25, fontFamily: "Poppins-bold"),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Search here...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Recent Post",
                style: TextStyle(fontSize: 25, fontFamily: "Poppins-bold"),
              ),
              const SizedBox(height: 10),
              Column(
                children: recentPosts.map((post) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company Name: ${post.companyName}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins-bold",
                              color: Colors.red.shade500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'jobTitle: ${post.jobTitle}',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Poppins-bold",
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Company Location: ${post.companylocation}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins-bold",
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
