import 'package:firebase/google_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  otpController = TextEditingController();
  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  void SignOutME() async{
    await _auth.signOut();
  }
  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
  {

    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if(authCred.user != null)
      {

        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Google_map()));
      }
    } on FirebaseAuthException catch (e) {

      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }


  showMobilePhoneWidget(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text(" Your Phone Number" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 7,),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: Colors.blue.withOpacity(0.1),
            child:       TextField(

              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8) ),
                  hintText: "Number..."
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: ()  async{
          await _auth.verifyPhoneNumber(

              phoneNumber: "+91${phoneController.text}",
              verificationCompleted: (phoneAuthCredential) async{


              },
              verificationFailed: (verificationFailed){
                print(verificationFailed);
              },

              codeSent: (verificationID, resendingToken) async{
                setState(() {

                  currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
                  this.verificationID = verificationID;
                });
              },
              codeAutoRetrievalTimeout: (verificationID) async{

              }
          );
        }, child: Text("Send OTP")),
        SizedBox(height: 16,),
        Spacer()
      ],
    );
  }


  showOtpFormWidget(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text("ENTER YOUR OTP" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 7,),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: Colors.blue.withOpacity(0.1),
            child:       TextField(

              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), ),
                  hintText: "OTP"
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {

          AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
          signInWithPhoneAuthCred(phoneAuthCredential);
        }, child: Text("Verify")),
        SizedBox(height: 16,),
        Spacer()
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),
    );
  }
}
