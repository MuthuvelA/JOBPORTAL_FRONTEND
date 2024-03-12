import 'package:flutter/material.dart';
import 'package:jobportal/component/view_model/jobsearchModel.dart';
import 'package:jobportal/component/view/profile_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constantString.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<JobSearchResult> recentPosts = [];
  List<JobSearchResult> filteredPosts = [];

  @override
  void initState() {
    super.initState();
    fetchRecentPosts();
  }

  void fetchRecentPosts() {
    JobSearchModel().searchJobs('recent').then((posts) {
      setState(() {
        recentPosts = posts;
        filteredPosts = recentPosts;
      });
    }).catchError((error) {
      print("Error fetching recent posts: $error");
    });
  }


  void search(String query) {
    setState(() {
      filteredPosts = recentPosts
          .where((post) =>
      post.companyName.toLowerCase().contains(query.toLowerCase()) ||
          post.jobTitle.toLowerCase().contains(query.toLowerCase()) ||
          post.companyLocation.toLowerCase().contains(query.toLowerCase()))
          .toList();
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
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (value) => search(value),
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
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Recent Post",
                  style: TextStyle(fontSize: 25, fontFamily: "Poppins-bold"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];
                    return Container(
                      height: 165,
                      width: 400,
                      child: Card(
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
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'jobTitle: ${post.jobTitle}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Poppins-bold",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Company Location: ${post.companyLocation}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Poppins-bold",
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  String url = '${post.jobApplicationLink}';
                                  String encodedUrl = Uri.encodeFull(url);
                                  try {
                                    await launch(encodedUrl);
                                  } catch (e) {
                                    print('Error launching URL: $e');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Apply for Job',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Poppins-bold",
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
