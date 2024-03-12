import 'dart:convert';
import 'package:http/http.dart' as http;

class JobSearchModel {
  Future<List<JobSearchResult>> searchJobs(String query) async {
    List<JobSearchResult> searchResults = [];

    try {
      var response = await http.post(
        Uri.parse("http://localhost:3002/recentjob"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"query": query}),
      );
      //print(response.body);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var dataList = jsonData['data'] as List;


        dataList.forEach((jobData) {
          var companyName = jobData['companyName'];
          var companyLocation = jobData['companyLocation'];
          var jobTitle = jobData['jobTitle'];
          var jobApplicationLink = jobData['jobApplicationLink'];


          var job = JobSearchResult(
            companyName: companyName,
            companyLocation: companyLocation,
            jobTitle: jobTitle,
            jobApplicationLink: jobApplicationLink,
          );
          searchResults.add(job);
        });
      } else {
        print('Failed to fetch search results. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching search results: $e');
    }
    return searchResults;
  }
}

class JobSearchResult {
  final String companyName;
  final String companyLocation;
  final String jobTitle;
  final String jobApplicationLink;

  JobSearchResult({required this.companyName, required this.companyLocation, required this.jobTitle, required this.jobApplicationLink});

  factory JobSearchResult.fromJson(dynamic json) {
    return JobSearchResult(
      companyName: json['companyName'] ?? '',
      companyLocation: json['companyLocation'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      jobApplicationLink: json['jobApplicationLink'] ?? '',
    );
  }
}
