import 'package:firebase/google_map.dart';
import 'package:flutter/services.dart';
import 'package:firebase/auth_service.dart';
import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(
    //runApp method
    // home: HomePage(),
  )); //MaterialApp
}

class login extends StatefulWidget {


  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController _controller = TextEditingController();


  late String email;
  late String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: 840,
                child: Image.asset(
                  'assets/images/abstract1.png',
                  fit: BoxFit.cover,
                )),
            Container(
                margin: EdgeInsets.only(bottom: 100),
                child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            Column(
              children: [
                Container(
                  // color: Colors.white,
                  margin: EdgeInsets.only(top: 200),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    //child: Card(
                    //margin: EdgeInsets.only(top: 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            child: TextFormField(
                              controller: emailController,
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
                              controller: passwordController,
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
                        ],
                      ),
                    ),
                    // ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15),
                  child: TextFormField(
                    obscureText: _isHidden,
                    controller: _controller,
                    decoration: InputDecoration(

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

                      hintText: "Enter mobile no",
                      labelText: "Mobile No",
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is Empty";
                      }
                      return null;
                    },
                    maxLength: 10,
                    autofocus: false,
                  ),
                ),
              ],
            ),

      // ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  //alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 600,right: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white70, width: 1.5)),
                      color: Colors.blue,
                      onPressed: () {
                        AuthService().signInWithFacebook();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Google_map()),
                        // );

                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ),
                Container(
                  //alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 600,right: 10),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.white70, width: 1.5)),
                      color: Colors.blue,
                      onPressed: () {
                        AuthService().signInWithGoogle();

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
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
          ],
        ),

      ),
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
