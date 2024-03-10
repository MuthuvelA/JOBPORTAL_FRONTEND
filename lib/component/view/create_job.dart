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
          SizedBox(height: 30),
          textFormFieldFor('Company Name', companyNameController),
          SizedBox(height: 20),
          textFormFieldFor('Company Website', companyWebsiteController),
          SizedBox(height: 20),
          textFormFieldFor('Job Title', jobTitleController),
          SizedBox(height: 20),
          dropdownFormFieldFor(
            'Select Job Category',
            dropDownValueForJob,
            jobCategories,
                (String? newValue) {
              setState(() {
                dropDownValueForJob = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          dropdownFormFieldFor(
            'Select Job Type',
            dropDownValueForJobTime,
            jobTime,
                (String? newValue) {
              setState(() {
                dropDownValueForJobTime = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          textFormFieldFor('Company Location', companyLocationController),
          SizedBox(height: 20),
          textFormFieldFor('Salary Range', salaryRangeController),
          SizedBox(height: 20),
          textFormFieldFor('Experience', experienceController),
          SizedBox(height: 20),
          textFormFieldFor('Qualification', qualificationController),
          SizedBox(height: 20),
          textFormFieldFor(
            'Application Deadline',
            applicationDeadlineController,
          ),
          SizedBox(height: 20),
          textFormFieldFor(
            'Job Application Link',
            jobApplicationLinkController,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Job Description',
              style: TextStyle(fontSize: 17, fontFamily: 'Poppins-bold'),
            ),
          ),
          SizedBox(height: 5),
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
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              postJob();
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
