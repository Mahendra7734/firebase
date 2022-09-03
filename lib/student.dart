import 'package:firebase/google_map.dart';
import 'package:firebase/update_studentpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Student_list extends StatefulWidget {
  const Student_list({Key? key}) : super(key: key);

  @override
  State<Student_list> createState() => _Student_listState();
}

class _Student_listState extends State<Student_list> {
  final Stream<QuerySnapshot> studentsStrem =FirebaseFirestore.instance.collection('students').snapshots();


  // For deleting user
  CollectionReference students=FirebaseFirestore.instance.collection('students');
 Future<void> deleteuser(id){
    //print("User Deleted $id");
   return students
       .doc(id)
       .delete()
       .then((value) => print("User Deleted"))
       .catchError((error)=>print("Failed to Delete user: $error"));

  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream:studentsStrem,builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
    if(snapshot.hasError){
      print("Something Went Wrong");
    }
    if(snapshot.connectionState==ConnectionState.waiting){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    final List storedocs=[];
    snapshot.data?.docs.map((DocumentSnapshot document){
      Map a=document.data() as  Map<String, dynamic>;
      storedocs.add(a);
      a ['id']= document.id;

    }).toList();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int,TableColumnWidth>{
            1:FixedColumnWidth(140)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                children: [
                  TableCell(child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child:Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
                    ),
                  )),
                  TableCell(child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child:Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
                    ),
                  )),

                  TableCell(child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child:Text("Action",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) ,
                    ),
                  )),
                ]
            ),

            for(var i=0; i<storedocs.length; i++)...[
            TableRow(
                children: [
                  TableCell(child: Container(

                    child: Center(
                      child:Text(storedocs[i]['name'],style: TextStyle(fontSize: 18,),) ,
                    ),
                  )),
                  TableCell(child: Container(

                    child: Center(
                      child:Text(storedocs[i]['email'],style: TextStyle(fontSize: 18),) ,
                    ),
                  )),

                  TableCell(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () =>{
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Update_Student(id: storedocs[i]['id'])))
                      }, icon: Icon(Icons.edit,color: Colors.orange,)),

                      IconButton(onPressed: () =>{
                      deleteuser(storedocs[i]['id'])
                     // print(storedocs)
                      }, icon: Icon(Icons.delete,color: Colors.red,))
                    ],

                  )
                  ),
                ]
            ),
                  ]
          ],
        ),
      ),
    );
    });



  }
}
