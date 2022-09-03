import 'package:firebase/google_map.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 15),
            child: TextFormField(
              //controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  suffix: Icon(Icons.email),
                  isDense: false,
                  contentPadding:
                  EdgeInsets.fromLTRB(20, 20, 20, 0),
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10))),

              onChanged: (value){
                setState((){
                  email=value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email is Empty";
                }
                return null;
              },
              autofocus: false,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 15),
            child: TextFormField(
              obscureText: _isHidden,
             // controller: passwordController,
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isHidden
                        ?

                    /// CHeck Show & Hide.
                    Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                isDense: true,
                contentPadding:
                EdgeInsets.fromLTRB(20, 20, 20, 0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                // border: OutlineInputBorder(
                //
                //     borderRadius: BorderRadius.circular(10)
                //
                // ),

                hintText: "Enter Password",
                labelText: "Password",
              ),
              onChanged: (value){
                setState((){
                  password=value;
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is Empty";
                }
                return null;
              },
              autofocus: false,
            ),
          ),
          Container(
            //alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 600,right: 10),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white70, width: 1.5)),
                color: Colors.blue,
                onPressed: ()async {

                  try{
                    final user= await _auth.createUserWithEmailAndPassword(email: email, password: password
                    );
                    if(user!=null){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Google_map()));
                    }
                  }catch(e){
                    print(e);
                  }
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
