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
      print(response.body);

      if (response.statusCode == 200) {
        // Parse the response JSON directly and create JobSearchResult objects
        var data = jsonDecode(response.body);
        print("ASDASDSAD\n");
        print(data);

        if (data is List && data.length >= 2) {
          // If there are at least two items in the response, create JobSearchResult objects for the first two items
          searchResults.add(JobSearchResult.fromJson(data[0]));
          searchResults.add(JobSearchResult.fromJson(data[1]));
        } else if (data is List && data.length == 1) {
          // If there is only one item in the response, create a single JobSearchResult object
          searchResults.add(JobSearchResult.fromJson(data[0]));
        }
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
  final String companylocation;
  final String jobTitle;

  JobSearchResult({required this.companyName, required this.companylocation, required this.jobTitle});

  factory JobSearchResult.fromJson(dynamic json) {
    return JobSearchResult(
      companyName: json['companyName'] ?? '',
      companylocation: json['companylocation'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
    );
  }
}
