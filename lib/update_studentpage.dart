

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Update_Student extends StatefulWidget {
  final String id;
  const Update_Student({Key? key,required this.id}) : super(key: key);

  @override
  State<Update_Student> createState() => _Update_StudentState();
}

class _Update_StudentState extends State<Update_Student> {
  final _formKey=GlobalKey<FormState>();

  // Updating Student
  CollectionReference students=FirebaseFirestore.instance.collection('students');
  Future<void> updateUser(id, name, email, password){
    // print("Add User");
    return students
        .doc(id)
        .update({'name' : name,'email' : email, 'password' : password})
        .then((value) => print("User Update"))
        .catchError((error)=>print("Failed to Update user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(

        // Getting Specific Data by ID
        key: _formKey,
        child:FutureBuilder<DocumentSnapshot <Map <String ,dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('students')
            .doc(widget.id)
            .get(),
      builder: (_,snapshot){
            if(snapshot.hasError){
              print("Something went Wrong");
            }if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            var data =snapshot.data!.data();
            var name=data!['name'];
            var email=data['email'];
            var password=data['password'];

            return   Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: name,
                     // controller: _namecontroller,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                      ),
                      onChanged: (value) => name=value,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: email,
                     // controller: _emailcontroller,
                      autofocus: false,
                      onChanged: (value) => email=value,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Please Enter Email';
                        }else if(!value.contains('@')){
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      initialValue: password,
                     // controller: _passwordcontroller,
                      autofocus: false,
                      obscureText: true,
                      onChanged: (value) => password=value,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(onPressed: (){
                          // Validate return true if the form is valid, otherwise false.
                          if(_formKey.currentState!.validate()){

                            updateUser(widget.id, name, email, password);
                            Navigator.pop(context);
                          }
                        }, child: Text("Register",style: TextStyle(fontSize: 18),)),

                        ElevatedButton(onPressed: (){
                          // Validate return true if the form is valid, otherwise false.

                        }, child: Text("Reset",style: TextStyle(fontSize: 18),
                        ),
                          style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ) ;
      },

        )

      ),
    );
  }
}
