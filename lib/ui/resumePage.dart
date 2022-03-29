import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/styleandborder.dart';
class ResumePage extends StatefulWidget {
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


  ResumePage({ this.id,this.name,
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
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  var height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Appcolors.signupsubmitButton,centerTitle: true,title:
      Text(
        'Resume',
        style:
        TextStyle(color: Appcolors.signupsubmitButtontextcolor, fontSize: 16),
      ),),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    //width: width*.56,
                    child: Column(             crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(widget.name,style: Textstyle1.Text18bold.copyWith(),),
                        SizedBox(height: 10,),
                        Text("Senior Product Designer",style: Textstyle1.Text14.copyWith(),) ,
                        SizedBox(height: 30),

                        Text("Experience",style: Textstyle1.Text14,),
                        SizedBox(height: 10,),
                        Text(widget.worktitle,style: Textstyle1.Text16,),SizedBox(height: 10,),
                        Text("${widget.workstartdate} -- ${widget.workenddate}",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 10,),

                        Text(widget.workdescriton,style: Textstyle1.Text14,)   ,
                        SizedBox(height: 30),

                        Text("Education",style: Textstyle1.Text14,),
                        SizedBox(height: 10,),
                        Text(widget.Educationdegree,style: Textstyle1.Text16,),SizedBox(height: 10,),
                        Text(widget.Educationgrade,style: Textstyle1.Text14),SizedBox(height: 10,),

                        Text(widget.Educationenddate,style: Textstyle1.Text14,)   ,

                      ],
                    ),
                  ),
                ),
                SizedBox(width: 14,),
                Container(
                  width:width*.3,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/profile.png',width: 80,height: 80,),
                      SizedBox(height: 25,),

                      Text(widget.email,style: Textstyle1.Text14),
                      SizedBox(height: 10,),

                      Text(widget.contact,style: Textstyle1.Text14.copyWith(fontSize: 14),),
                      Text(widget.address,style: Textstyle1.Text14.copyWith(fontSize: 12),),

                      SizedBox(height: 20,),

                      Text("Other skills",style: Textstyle1.Text14bold,),SizedBox(height: 7,),

                      Text("HTML,CSS,JQuery",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 10,),

                      SizedBox(height: 20,),

                      Text("Language",style: Textstyle1.Text14bold,),SizedBox(height: 7,),

                      Text("Franch(Native)",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 5,),
                      Text("English(Professional)",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 10,),
                      SizedBox(height: 20,),

                      Text("Social",style: Textstyle1.Text14bold,),SizedBox(height: 7,),

                      Text("yoursite.com",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 5,),
                      Text("linkedin.com/in/yourname",style: Textstyle1.Text14.copyWith(fontSize: 12),),SizedBox(height: 10,),

                    ],
                  ),
                )
              ],
            ),


        ]),
      ),
    );
  }
}
