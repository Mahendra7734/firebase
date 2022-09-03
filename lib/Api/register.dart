import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _mobilecontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  TextEditingController _usernameroller=TextEditingController();

  Future Register(String email,mobile,password,username) async{
    final http.Response response=await http.post(Uri.parse('http://premad.in/chitfund_api/Api/CustomerRegister'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      body: jsonEncode(<String, String>{
        'email':email,
        'mobile':mobile,
        'password':password,
        'username':username

    }));
    if(response.statusCode==200){
      var data=jsonDecode(response.body.toString());
      print(data['message']);
      if(data['status']=='Success'){
        print(data['message']);
        return data['data'];
      }else{
        return Future.error(data['message']);
      }
    }else{
      return Future.error('Server error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: " Email",
                suffix: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _mobilecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mobile",
                suffix: Icon(Icons.location_city),
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                suffix: Icon(Icons.email),
              ),
            ),
            TextFormField(
              controller: _usernameroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "User Name",
                suffix: Icon(Icons.phone_android),
              ),
              //keyboardType: TextInputType.number,
            ),

            Container(
              margin: EdgeInsets.only(top: 50),
              child: RaisedButton(
                onPressed: () {
                  Register(_emailcontroller.text.toString(), _mobilecontroller.text.toString(), _passwordcontroller.text.toString(), _usernameroller.text.toString())
                      .then((value) {
                    print('tap');

                  })
                      .catchError((e) {
                    print(e.toString());
                  });
                  },

                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
