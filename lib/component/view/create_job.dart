import 'package:flutter/material.dart';
import 'package:jobportal/component/view/profile_employer_view.dart';
import 'package:jobportal/component/view_model/JobDetailModel.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({Key? key}) : super(key: key);

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  String? dropDownValueForJob;
  String? dropDownValueForJobTime;
  List<String> jobCategories = [
    'Software Development',
    'Data Science',
    'Artificial Intelligence',
    'Machine Learning',
    'Web Development',
    'Mobile Development',
    'UI/UX Design',
    'Product Management',
    'Digital Marketing',
    'Finance',
    'Healthcare',
    'Education',
    'Sales',
    'Customer Support',
    'Human Resources',
    'Engineering',
    'Operations',
    'Business Development',
    'Consulting',
    'Research',
  ];
  List<String> jobTime = [
    'full time',
    'part time',
    'internship'
  ];
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyWebsiteController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  TextEditingController salaryRangeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController applicationDeadlineController = TextEditingController();
  TextEditingController jobApplicationLinkController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CREATE JOB",
          style: TextStyle(fontSize: 20, fontFamily: "Poppins-bold"),
        ),
        centerTitle: true,
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
                  builder: (context) => ProfileEmployeePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormFieldForJob(),
        ),
      ),
    );
  }

  Widget FormFieldForJob() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: textFormFieldFor('Company Name', companyNameController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Company Website', companyWebsiteController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Job Title', jobTitleController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: dropdownFormFieldFor(
              'Select Job Category',
              dropDownValueForJob,
              jobCategories,
                  (String? newValue) {
                setState(() {
                  dropDownValueForJob = newValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: dropdownFormFieldFor(
              'Select Job Type',
              dropDownValueForJobTime,
              jobTime,
                  (String? newValue) {
                setState(() {
                  dropDownValueForJobTime = newValue;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Company Location', companyLocationController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Salary Range', salaryRangeController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Experience', experienceController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor('Qualification', qualificationController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor(
              'Application Deadline',
              applicationDeadlineController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: textFormFieldFor(
              'Job Application Link',
              jobApplicationLinkController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Job Description',
                style: TextStyle(fontSize: 17, fontFamily: 'Poppins-bold'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: jobDescriptionController,
              decoration: InputDecoration(
                hintText: 'Job Description',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade200,
                  fontFamily: 'Poppins-bold',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                postJob();
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('SUCCESSFULL'),
                    content: Text('JOB POSTED SUCCESSFULLY'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Post Job',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFormFieldFor(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }

  Widget dropdownFormFieldFor(
      String label,
      String? value,
      List<String> items,
      void Function(String?) onChanged,
      ) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void postJob() {
    // Call the saveJobPost method from JobDetailModel
    JobDetailModel().saveJobPost(
      companyName: companyNameController.text,
      companyWebsite: companyWebsiteController.text,
      jobTitle: jobTitleController.text,
      jobCategory: dropDownValueForJob ?? "",
      jobType: dropDownValueForJobTime ?? "",
      companyLocation: companyLocationController.text,
      salaryRange: salaryRangeController.text,
      experience: experienceController.text,
      qualification: qualificationController.text,
      applicationDeadline: applicationDeadlineController.text,
      jobApplicationLink: jobApplicationLinkController.text,
      jobDescription: jobDescriptionController.text,
    );
  }
}
