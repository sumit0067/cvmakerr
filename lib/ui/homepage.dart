import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvmakerr/ui/firebase_service.dart';
import 'package:cvmakerr/ui/resumePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addResumeDetails.dart';
import '../components/styleandborder.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Appcolors.signupsubmitButton,
          title:Text(
        'List of all Resume',
        style:
        TextStyle(color: Appcolors.signupsubmitButtontextcolor, fontSize: 16),
      )
          ,actions: [IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddResumeDetails()));}, icon: Icon(Icons.add))]),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('fields').snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("erro");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("laoding");
          }
          final data = snapshot.data;
          print(data);
          return ListView.builder(
              itemCount: data.docs.length,
              itemBuilder: (context,index){

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumePage(id:data.docs[index].id,name:data.docs[index]['name'] ,address: data.docs[index]['address'],contact: data.docs[index]['contact'].toString(),email: data.docs[index]['email'],dob: data.docs[index]['dob'],Educationdegree: data.docs[index]['degree'],Educationenddate: data.docs[index]['Educationenddate'],Educationgrade: data.docs[index]['grades'],workdescriton: data.docs[index]['workdesc'],workenddate: data.docs[index]['workenddate'],workstartdate: data.docs[index]['workstartdate'],worktitle: data.docs[index]['worktitle'],)));

                  },
                    child: Card(elevation: 5,
                      child: Container(
                      //  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                Container(height: 20,child:
                                Text("Name  :  ${data.docs[index]['name']}",
                                  style: Textstyle1.signupText.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                                Expanded(child: Container()),
                                InkWell(onTap: (){

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Are you sure?',style: Textstyle1.signupText.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      )),
                                      content: Text('Do you want to Delete this Buyer',style: Textstyle1.signupText.copyWith()),
                                      actions: <Widget>[
                                        FlatButton(
                                          color: Color(0xFFF8FAFC),
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: Text('No',style: Textstyle1.signupText.copyWith()),
                                        ),
                                        FlatButton(
                                          color: Color(0xFFF8FAFC),
                                          onPressed: () async {
                                            Navigator.of(context).pop(true);
                                            await FirebaseFirestore.instance.collection('fields').doc(data.docs[index].id).delete();
                                          },
                                          child: Text('Yes',style: Textstyle1.signupText.copyWith()),
                                        ),
                                      ],
                                    ),
                                  );
//Navigator.pop(context);
                                },child:
                                Icon(Icons.delete)),
                                //Image.asset("assets/images/Delete.png",height: 25,color: Appcolors.signuptextcolor)),
                                SizedBox(width: 20),
                                InkWell(onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>AddResumeDetails(
                                            id:data.docs[index].id,
                                            name:data.docs[index]['name'] ,
                                            address: data.docs[index]['address'],
                                            contact: data.docs[index]['contact'].toString(),
                                            email: data.docs[index]['email'],
                                            dob: data.docs[index]['dob'],
                                            Educationdegree: data.docs[index]['degree'],
                                            Educationenddate: data.docs[index]['Educationenddate'],
                                            Educationgrade: data.docs[index]['grades'],
                                            workdescriton: data.docs[index]['workdesc'],
                                            workenddate: data.docs[index]['workenddate'],
                                            workstartdate: data.docs[index]['workstartdate'],
                                            worktitle: data.docs[index]['worktitle'],
                                          ),
                                      ),
                                  );
                                },child:
                                Icon(Icons.edit)),
                                //Image.asset("assets/images/Edit.png",height: 24,color: Appcolors.signuptextcolor)),
                                SizedBox(width: 10),
                              ],
                            ),

                            Text("Contact  :  ${data.docs[index]['contact']}",style: Textstyle1.signupText.copyWith(fontSize: 16),),
                            Text("Address  :  ${data.docs[index]['address']},",style: Textstyle1.signupText.copyWith(fontSize: 16),),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            );
          });
        },)
    );
  }
}
