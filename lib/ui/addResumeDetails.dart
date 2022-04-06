import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/styleandborder.dart';


class AddResumeDetails extends StatefulWidget {
  String id;
  String name;
  String contact;
  String email;
  String address;
  String dob;
  String Educationdegree;
  String Educationgrade;
  String Educationenddate;
  String worktitle;
  String workdescriton;
  String workstartdate;
  String workenddate;


  AddResumeDetails({ this.id,this.name,
    this.contact,
    this.email,
    this.address,
    this.dob,
    this.Educationdegree,
    this.Educationenddate,
    this.Educationgrade,
    this.workdescriton,
    this.workenddate,
    this.workstartdate,
    this.worktitle,
    Key key}) : super(key: key);

  @override
  State<AddResumeDetails> createState() => _AddResumeDetailsState();
}



class _AddResumeDetailsState extends State<AddResumeDetails> {

  _selecttDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        // firstDate: DateTime.now().subtract(Duration(days: 10)),
        firstDate: DateTime(2015),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xFF0048D9),
                onPrimary: Colors.white,
                surface: Color(0xFF0048D9),
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        }
    );
    return newSelectedDate;
  }

  bool isLoading=false;
  final fb=FirebaseDatabase.instance;


  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController=TextEditingController();
  TextEditingController _ContactController=TextEditingController();
  TextEditingController _EmailController=TextEditingController();
  TextEditingController _AddressController=TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController DegreeController = TextEditingController();
  TextEditingController StartController = TextEditingController();
  TextEditingController EndController = TextEditingController();
  TextEditingController EducationEndController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionCotroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  DateTime _selectedEducationEndDate = DateTime.now();


  List<DropdownMenuItem<String>> yeardropdown = [];
  List<DropdownMenuItem<String>> gradedropdown = [];

  int value1;
  List<DropdownMenuItem<String>> get gradesdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("A+"), value: "A+"),
      DropdownMenuItem(child: Text("A"), value: "A"),
      DropdownMenuItem(child: Text("B+"), value: "B+"),
      DropdownMenuItem(child: Text("B"), value: "B"),
      DropdownMenuItem(child: Text("C+"), value: "C+"),
      DropdownMenuItem(child: Text("C"), value: "C"),
      DropdownMenuItem(child: Text("D"), value: "D"),
    ];
    return menuItems;
  }
  String selectedGrades;

  List<Widget> workDetail = [];

 Widget addWordDetail(){
   return Column(
     children: [
       Text("Work Experience",style: Textstyle1.signupText,),
       SizedBox(height: 10,),
       TextFormField(
         style: Textstyle1.signupText,
         validator: (value) {
           if (value == null || value.isEmpty) {
             return 'Enter Title';
           }
           return null;
         },
         decoration: Textfield1.inputdec.copyWith(hintText: "Title"),),


       SizedBox(height: 10,),
       TextFormField(
         style: Textstyle1.signupText,
         // controller: descriptionCotroller,
         validator: (value) {
           if (value == null || value.isEmpty) {
             return 'Enter Descrition';
           }
           return null;
         },
         decoration: Textfield1.inputdec.copyWith(hintText: "Descrition"),
       ),
       SizedBox(height: 10,),

       Row(
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Select Date",style: Textstyle1.signupText,),
               SizedBox(height: 10,),
               Container(
                 width:double.infinity,
                 child: TextFormField(
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Select date';
                     }
                     return null;
                   },
                   maxLength: 20,maxLengthEnforced: true,
                   readOnly: true,
                   style: Textstyle1.signupText,
                   keyboardType: TextInputType.number,
                   // controller: StartController,
                   focusNode: AlwaysDisabledFocusNode(),
                   onTap: () async {
                     // FocusScope.of(context).unfocus();

                     //DateTime newSelectedDate = await _selecttDate(context);
                     /*if (newSelectedDate != null) {
                      *//*setState(() {
                        _selectedStartDate = newSelectedDate;
                        initializeDateFormatting('es');
                        StartController
                          ..text = DateFormat("dd-MMM-yyyy").format(_selectedStartDate)
                          ..selection = TextSelection.fromPosition(TextPosition(
                              offset: StartController.text.length,
                              affinity: TextAffinity.upstream
                          )
                          );
                      });*//*
                    }*/
                   },
                   decoration: fieldStyle.copyWith(counterText: " ",
                     hintStyle: Textstyle1.signupText.copyWith(
                       color: Color(0xffB8BCCA),
                     ),
                     hintText: "Start Date",
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
           Expanded(child: SizedBox(width: 10,)),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("",style: Textstyle1.signupText,),
               SizedBox(height: 10,),
               Container(
                 width:double.infinity,
                 child: TextFormField(
                   validator: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Select date';
                     }
                     return null;
                   },
                   maxLength: 20,maxLengthEnforced: true,
                   readOnly: true,
                   style: Textstyle1.signupText,
                   keyboardType: TextInputType.number,
                   // controller: EndController,
                   focusNode: AlwaysDisabledFocusNode(),
                   onTap: () async {
                     // FocusScope.of(context).unfocus();

                     /*  DateTime newSelectedDate = await _selecttDate(context);
                    if (newSelectedDate != null) {
                      setState(() {
                        _selectedEndDate = newSelectedDate;
                        initializeDateFormatting('es');
                        EndController
                          ..text = DateFormat("dd-MMM-yyyy").format(_selectedEndDate)
                          ..selection = TextSelection.fromPosition(TextPosition(
                              offset: EndController.text.length,
                              affinity: TextAffinity.upstream
                          )
                          );
                      });
                    }*/
                   },
                   decoration: fieldStyle.copyWith(counterText: " ",
                     hintStyle: Textstyle1.signupText.copyWith(
                       color: Color(0xffB8BCCA),
                     ),
                     hintText: "End Date",
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.transparent,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),

         ],),

     ],);
 }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.name != null){
      _nameController.text=widget.name;
      _ContactController.text=widget.contact;
      _EmailController.text=widget.email;
      _AddressController.text=widget.address;
      dobController.text=widget.dob;
      DegreeController.text=widget.Educationdegree;
      selectedGrades=widget.Educationgrade;
      EducationEndController.text=widget.Educationenddate;
      titleController.text=widget.worktitle;
      descriptionCotroller.text=widget.workdescriton;
      StartController.text=widget.workstartdate;
      EndController.text=widget.workenddate;
    }
  }


  var height,width;

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Appcolors.backgroundwhite,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Appcolors.signupsubmitButton,centerTitle: true,title:  widget.name !=null ?Text(
        'Update Resume',
        style:
        TextStyle(color: Appcolors.signupsubmitButtontextcolor, fontSize: 16),
      ):Text(
        'Add Resume',
        style:
        TextStyle(color: Appcolors.signupsubmitButtontextcolor, fontSize: 16),
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Form(key: _formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
       //       Text("Resume",style: Textstyle1.signupheadingText,),
              SizedBox(height: 20,),
              Text("Name",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(inputFormatters: [
                UpperCaseTextFormatter(),
              ],
                style: Textstyle1.signupText,decoration: Textfield1.inputdec, controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                }
                ,),


              SizedBox(height: 20,),
              Text("Contact",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller:_ContactController,keyboardType: TextInputType.number,validator: (value) {
                if (value.length <10  || value.isEmpty) {
                  return 'Please enter your Contact no.';
                }
                return null;
              },decoration: Textfield1.inputdec.copyWith(hintText: "Contact No."),),
              SizedBox(height: 20,),
              Text("Email",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller: _EmailController,
                  validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                decoration: Textfield1.inputdec.copyWith(hintText: "Email "),),
              SizedBox(height: 20,),
              Text("Date of birth",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select date';
                  }
                  return null;
                },
                maxLength: 20,maxLengthEnforced: true,
                readOnly: true,
                style: Textstyle1.signupText,
                keyboardType: TextInputType.number,
                controller: dobController,
                focusNode: AlwaysDisabledFocusNode(),
                onTap: () async {
                  FocusScope.of(context).unfocus();

                  DateTime newSelectedDate = await _selecttDate(context);
                  if (newSelectedDate != null) {
                    setState(() {
                      _selectedDate = newSelectedDate;
                      initializeDateFormatting('es');
                      dobController
                        ..text = DateFormat("dd-MMM-yyyy").format(_selectedDate)
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: dobController.text.length,
                            affinity: TextAffinity.upstream
                        )
                        );
                    });
                  }
                },
                decoration: fieldStyle.copyWith(counterText: " ",
                  hintStyle: Textstyle1.signupText.copyWith(
                    color: Color(0xffB8BCCA),
                  ),
                  hintText: "Select Date",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
             SizedBox(height: 10,),
              Text("Address",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller: _AddressController,maxLines: 3,
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your  Address';
                  }
                  return null;
                },
                decoration: Textfield1.inputdec.copyWith(hintText: "Enter your Address"),),
               SizedBox(height:20,),
              Text("Education",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller: DegreeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Degree';
                  }
                  return null;
                },
                decoration: Textfield1.inputdec.copyWith(hintText: "Enter your Degree"),),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Grades",style: Textstyle1.signupText,),

                    SizedBox(height: 10,),
                    Container(width: width/2.4,
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select grades';
                          }
                          return null;
                        },
                        isExpanded: true,isDense: true,
                        decoration: InputDecoration(
                          // errorBorder: OutlineInputBorder(
                          //   gapPadding: 00,
                          //   borderRadius:
                          //   BorderRadius.circular(6.0),
                          //   borderSide: BorderSide(
                          //     color: Colors.red,
                          //   )),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Appcolors.textfieldColot),
                          //   borderRadius: BorderRadius.circular(6),
                          // ),

                          filled: true,
                          fillColor: Appcolors.textfieldColot,
                          hintText: 'Select Grade',
                          hintStyle: TextStyle(
                              color:Color(0xffB8BCCA),
                              fontFamily: 'IBMPlexSans-Regular',
                              fontSize: 14),
                        ),
                        dropdownColor: Appcolors.textfieldColot,
                        // validator: (value){
                        //   if(value==null){
                        //     return 'Please select';
                        //   }
                        // },
                        value: selectedGrades,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedGrades = newValue;
                          });
                        },
                        items: gradesdropdownItems,
                        style: TextStyle(
                            color: Appcolors.textfieldTextColot,
                            fontFamily: 'IBMPlexSans-Regular',
                            fontSize: 14),
                      ),
                    ),
                    // DropdownButton(
                    //     value: selectedGrades,
                    //     onChanged: (String newValue){
                    //       setState(() {
                    //         selectedGrades = newValue;
                    //       });
                    //     },
                    //     items: gradedropdown
                    // )
                  ],
                ),
                Expanded(child: SizedBox(width: 10,)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("End date",style: Textstyle1.signupText,),
                    SizedBox(height: 10,),
                    Container(
                      width:width/2.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select date';
                          }
                          return null;
                        },
                        maxLength: 20,maxLengthEnforced: true,
                        readOnly: true,
                        style: Textstyle1.signupText,
                        keyboardType: TextInputType.number,
                        controller: EducationEndController,
                        focusNode: AlwaysDisabledFocusNode(),
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          DateTime newSelectedDate = await _selecttDate(context);
                          if (newSelectedDate != null) {
                            setState(() {
                              _selectedEducationEndDate = newSelectedDate;
                              initializeDateFormatting('es');
                              EducationEndController
                                ..text = DateFormat("dd-MMM-yyyy").format(_selectedEducationEndDate)
                                ..selection = TextSelection.fromPosition(TextPosition(
                                    offset: EducationEndController.text.length,
                                    affinity: TextAffinity.upstream
                                )
                                );
                            });
                          }
                        },
                        decoration: fieldStyle.copyWith(counterText: " ",
                          hintStyle: Textstyle1.signupText.copyWith(
                            color: Color(0xffB8BCCA),
                          ),
                          hintText: "Select Date",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],),
              SizedBox(height:10,),
              Text("Work Experience",style: Textstyle1.signupText,),
              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Title';
                  }
                  return null;
                },
                decoration: Textfield1.inputdec.copyWith(hintText: "Title"),),


              SizedBox(height: 10,),
              TextFormField(style: Textstyle1.signupText,controller: descriptionCotroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Descrition';
                  }
                  return null;
                },
                decoration: Textfield1.inputdec.copyWith(hintText: "Descrition"),),
              SizedBox(height: 10,),

              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Date",style: Textstyle1.signupText,),
                    SizedBox(height: 10,),
                    Container(
                      width:width/2.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select date';
                          }
                          return null;
                        },
                        maxLength: 20,maxLengthEnforced: true,
                        readOnly: true,
                        style: Textstyle1.signupText,
                        keyboardType: TextInputType.number,
                        controller: StartController,
                        focusNode: AlwaysDisabledFocusNode(),
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          DateTime newSelectedDate = await _selecttDate(context);
                          if (newSelectedDate != null) {
                            setState(() {
                              _selectedStartDate = newSelectedDate;
                              initializeDateFormatting('es');
                              StartController
                                ..text = DateFormat("dd-MMM-yyyy").format(_selectedStartDate)
                                ..selection = TextSelection.fromPosition(TextPosition(
                                    offset: StartController.text.length,
                                    affinity: TextAffinity.upstream
                                )
                                );
                            });
                          }
                        },
                        decoration: fieldStyle.copyWith(counterText: " ",
                          hintStyle: Textstyle1.signupText.copyWith(
                            color: Color(0xffB8BCCA),
                          ),
                          hintText: "Start Date",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox(width: 10,)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("",style: Textstyle1.signupText,),
                    SizedBox(height: 10,),
                    Container(
                      width:width/2.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Select date';
                          }
                          return null;
                        },
                        maxLength: 20,maxLengthEnforced: true,
                        readOnly: true,
                        style: Textstyle1.signupText,
                        keyboardType: TextInputType.number,
                        controller: EndController,
                        focusNode: AlwaysDisabledFocusNode(),
                        onTap: () async {
                          FocusScope.of(context).unfocus();

                          DateTime newSelectedDate = await _selecttDate(context);
                          if (newSelectedDate != null) {
                            setState(() {
                              _selectedEndDate = newSelectedDate;
                              initializeDateFormatting('es');
                              EndController
                                ..text = DateFormat("dd-MMM-yyyy").format(_selectedEndDate)
                                ..selection = TextSelection.fromPosition(TextPosition(
                                    offset: EndController.text.length,
                                    affinity: TextAffinity.upstream
                                )
                                );
                            });
                          }
                        },
                        decoration: fieldStyle.copyWith(counterText: " ",
                          hintStyle: Textstyle1.signupText.copyWith(
                            color: Color(0xffB8BCCA),
                          ),
                          hintText: "End Date",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],),



              SizedBox(height:20,),

             isLoading==true
                 ?
             CircularProgressIndicator()
                 :
             Container(
                height: MediaQuery.of(context).size.height*.055,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Appcolors.signupsubmitButton),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        // side: BorderSide(
                        //   color: Appcolors.button_white,
                        //   width: 2.0,
                        // ),
                      ),
                    ),
                  ),
                  child: Text(
                    widget.name != null ?  "Update Resume" : 'Create Resume',
                    style:
                    TextStyle(color: Appcolors.signupsubmitButtontextcolor, fontSize: 16),
                  ),
                  onPressed: () async {

                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading=true;
                      });
                            if(widget.name==null){

                              final docuser = FirebaseFirestore.instance
                                  .collection('fields').doc();

                              final json = {
                                'name':_nameController.text,
                                'contact':_ContactController.text,
                                'email':_EmailController.text,
                                'address':_AddressController.text,
                                'dob':dobController.text,
                                'degree':DegreeController.text,
                                'grades':selectedGrades,
                                'Educationenddate':EducationEndController.text,
                                'worktitle':titleController.text,
                                'workdesc':descriptionCotroller.text,
                                'workstartdate':StartController.text,
                                'workenddate':EndController.text
                              };


                              await docuser.set(json);
                              setState(() {
                                isLoading=false;
                              });
                            }
                            else{

                              final json={
                                'name':_nameController.text,
                                'contact':_ContactController.text,
                                'email':_EmailController.text,
                                'address':_AddressController.text,
                                'dob':dobController.text,
                                'degree':DegreeController.text,
                                'grades':selectedGrades,
                                'Educationenddate':EducationEndController.text,
                                'worktitle':titleController.text,
                                 'workdesc':"word Desc",
                                'workstartdate':StartController.text,
                                'workenddate':EndController.text
                              };
                              FirebaseFirestore.instance.collection('fields').doc(widget.id).update(json);
                              setState(() {
                                isLoading=false;
                              });
                              Navigator.pop(context);
                            }
                      // createuser(name:_nameController.text,email: _EmailController.text,address: _AddressController.text,);


                    }

                  },
                ),
              ),
            ],),
          ),
        ),
      ),);
  }
  // Future createuser({ String name,int contact,String email,String address,String dob,String degree,String grades,String })async{
  //   final docuser =FirebaseFirestore.instance.collection('fields').doc();
  //   final json={
  //     'name':name,
  //     'contact':contact,
  //     'email':email,
  //      'address':address,
  //     '':
  //
  //   };
  //   await docuser.set(json);
  // }
  // Future updateUser({ String name,int contact,String email,String address,String state,int code,String city,String gst,String gsttype})async{
  //   final updatedata={
  //     // 'name':name,
  //     // 'contact':contact,
  //     // 'email':email,
  //     // 'address':address,
  //     // 'state':state,
  //     // 'code':code,
  //     // 'city':city,
  //     // 'gst':gst,
  //     // 'gsttype':gsttype
  //   };
  //   FirebaseFirestore.instance.collection('fields').doc(widget.id).update(updatedata);
  //
  // }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}