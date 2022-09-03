import 'package:firebase/Api/GetApi.dart';
import 'package:firebase/home_page.dart';
import 'package:firebase/signup.dart';
import 'package:firebase/student.dart';
import 'package:flutter/material.dart';

import 'Api/post.dart';
import 'Api/register.dart';
import 'auth_service.dart';
import 'google_map.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_phone.dart';
void main()async {
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialazation =Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:_initialazation,builder: (context , snapshot){
      // cheak for error

      if(snapshot.hasError){
        print("Something went wrong");
      }
      if(snapshot.connectionState==ConnectionState.done){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          //home: AuthService().handleAuthState(),
          //home: HomePage(),
         // home: AuthService().handleAuthState(),
         // home: GetCustomerDetails(),
         // home: SavePlan(),
          home: Register(),

          // routes: {
          //   '/Signup':(_)=>Signup(),
          //   '/Google_map':(_)=>Google_map()
          // },
        );
      }
      return CircularProgressIndicator();
    });


  }
}


