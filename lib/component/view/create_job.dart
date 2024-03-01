import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  String ?dropDownValueForJob ;
  String ?dropDownValueForJobTime ;
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
  List<String> jobTime=[
    'full time',
  'part time',
    'internship'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CREATE JOB",style: TextStyle(fontSize: 20, fontFamily: "Poppins-bold"),),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: FormFeildForJob()),
    );
  }
  Widget FormFeildForJob(){
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Form(
          child: Column(
            children: [
              SizedBox(height: 30,),
              textForFormFeild("Company Name"),
              SizedBox(height: 5,),
              textFeilfForForm("Name"),
              SizedBox(height: 20,),
              textForFormFeild("Company Website"),
              SizedBox(height: 5,),
              textFeilfForForm("Website link"),
              SizedBox(height: 20,),
              textForFormFeild("Job Title"),
              SizedBox(height: 5,),
              textFeilfForForm("Title"),

              SizedBox(height: 20,),
              textForFormFeild("select Job catagory"),
              Align(alignment: Alignment.centerLeft,
                  child: dropDownButtonForJobCatogory()),
              SizedBox(height: 20,),
              textForFormFeild("select Job type"),
              Align( alignment: Alignment.centerLeft,
                  child: dropDownButtonForJobTime()),
              //remainder--------------------------------------------------2 dropdown value-----------------------------------------------------
              SizedBox(height: 20,),
              textForFormFeild("Company Location"),
              SizedBox(height: 5,),
              textFeilfForForm("Location"),
              SizedBox(height: 20,),
              textForFormFeild("Salry Range"),
              SizedBox(height: 5,),
              textFeilfForForm("Salary Range"),

              SizedBox(height: 20,),
              textForFormFeild("Experience"),
              SizedBox(height: 5,),
              textFeilfForForm("Experience"),

              SizedBox(height: 20,),
              textForFormFeild("Qualification"),
              SizedBox(height: 5,),
              textFeilfForForm("Qualification"),

              SizedBox(height: 20,),
              textForFormFeild("Application Deadline"),
              SizedBox(height: 5,),
              textFeilfForForm("Application Deadline"),

              SizedBox(height: 20,),
              textForFormFeild("Job Application link"),
              SizedBox(height: 5,),
              textFeilfForForm("Job Application link url"),

              SizedBox(height: 20,),
              Align(
              alignment: Alignment.centerLeft,
              child: Text("Job Description",style: TextStyle(
              fontSize: 17,
              fontFamily: "Poppins-bold"
              ),
              ),
              ),
              SizedBox(height: 5,),
              Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              ),
                child: TextFormField(
                decoration: InputDecoration(
                hintText: "Job Description",
                hintStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade200,
                  fontFamily: "Poppins-bold"
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue,width: 2)
                )
                ),
                  maxLines: 4,
                ),
                ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {},
                child: Text("Post Job", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
  
  Widget textFeilfForForm(String hint){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade200,
              fontFamily: "Poppins-bold"
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue,width: 2)
            )
        ),
      ),
    );
  }
  Widget textForFormFeild(String text){
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text,style: TextStyle(
          fontSize: 17,
          fontFamily: "Poppins-bold"
      ),
      ),
    );
  }
  Widget dropDownButtonForJobCatogory(){
     return DropdownButton<String>(
      value: dropDownValueForJob,
      onChanged: (String? newValue) {
        setState(() {
          dropDownValueForJob = newValue;
        });
      },
      items: jobCategories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  Widget dropDownButtonForJobTime(){
    return DropdownButton<String>(
      value: dropDownValueForJobTime,
      onChanged: (String? newValue) {
        setState(() {
          dropDownValueForJobTime = newValue;
        });
      },
      items: jobTime.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ); 
  }
}
