import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_Student extends StatefulWidget {
  const Add_Student({Key? key}) : super(key: key);

  @override
  State<Add_Student> createState() => _Add_StudentState();
}

class _Add_StudentState extends State<Add_Student> {
  final _formKey= GlobalKey<FormState>();
  var name="";
  var email="";
  var password = "";

  // creat a text controller and use it to retrieve the current  value
  // of the Textfield.
  final _namecontroller=TextEditingController();
  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  clearText(){
    _namecontroller.clear();
    _emailcontroller.clear();
    _passwordcontroller.clear();
  }

  // Adding Student
  CollectionReference students=FirebaseFirestore.instance.collection('students');
 Future<void> addUser(){
   // print("Add User");
   return students
       .add({'name' : name,'email' : email, 'password' : password})
       .then((value) => print("User Added"))
       .catchError((error)=>print("Failed to Add user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _namecontroller,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                  ),
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
                  controller: _emailcontroller,
                  autofocus: false,
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
                  controller: _passwordcontroller,
                  autofocus: false,
                  obscureText: true,
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
                           setState((){
                             name=_namecontroller.text;
                             email=_emailcontroller.text;
                             password=_passwordcontroller.text;
                             addUser();
                             clearText();
                           });
                         }
                       }, child: Text("Register",style: TextStyle(fontSize: 18),)),

                    ElevatedButton(onPressed: (){
                      // Validate return true if the form is valid, otherwise false.
                     clearText();
                    }, child: Text("Reset",style: TextStyle(fontSize: 18),
                    ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
