import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SavePlan extends StatefulWidget {
  const SavePlan({Key? key}) : super(key: key);

  @override
  State<SavePlan> createState() => _SavePlanState();
}

class _SavePlanState extends State<SavePlan> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _namecontriller = TextEditingController();
  TextEditingController _mobilecontriller = TextEditingController();
  TextEditingController _addresscontriller = TextEditingController();
  TextEditingController _gendercontriller = TextEditingController();
  TextEditingController _dobcontriller = TextEditingController();
  TextEditingController _batch_idcontriller = TextEditingController();
  TextEditingController _plan_idcontriller = TextEditingController();
  TextEditingController _paid_amountcontriller = TextEditingController();
  TextEditingController _due_amountcontriller1 = TextEditingController();
  TextEditingController _start_joningcontriller1 = TextEditingController();
  TextEditingController _imagecontriller1 = TextEditingController();

  void SavePlan(String name, mobile, address, gender, dob,
       batch_id,plan_id,paid_amount,due_amount,start_joining) async {

    if(_fromkey.currentState!.validate()){
      try {
        Response response = await post(
            Uri.parse("https://www.premad.in/GYM/Api/saveCustomer"),
          body:{

                        'name': name,
                        'mobile': mobile,
                        'address': address,
                        'gender': gender,
                        'dob': dob,
                        'batch_id': batch_id,
                        'plan_id': plan_id,
                        'paid_amount': paid_amount,
                        'due_amount': due_amount,
                        'start_joining': start_joining,

          });

        if (response.statusCode == 200) {
          var responseData = json.decode(response.body);

          var status = responseData["status"];

          print("responseCode" + status.toString());

          if (status == "Success") {
            var data = responseData["data"];
            print(response.body);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Login Succesfully"),
            ));
            //  print(responseData["message"]);
            print(status);
            print("name" + name);
            print("mobile" + mobile);
            print("address" + address);
            print("gender" + gender);

            //   var message = responseData["message"];

            // print("data"+data[04]["name"]);

          } else {
            //var message = responseData["message"];
            print("Failure");

          }
        } else {
          var responseData = json.decode(response.body);
          var message = responseData["message"];

          print("name" + name);
          print("mobile" + mobile);
          print("address" + address);
          print("gender" + gender);
          // print("address"+address);
          // print("fuler"+response.body);
        }
      } catch (e) {
        print(e.toString());
        // Fluttertoast.showToast(
        //     msg: ""+e.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0
        // );
      }
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _namecontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: " Name",
                      suffix: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    controller: _mobilecontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Mobile",
                      suffix: Icon(Icons.location_city),
                    ),
                  ),
                  TextFormField(
                    controller: _addresscontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Address",
                      suffix: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    controller: _gendercontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Gender",
                      suffix: Icon(Icons.phone_android),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _dobcontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "dob",
                      suffix: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    controller: _batch_idcontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Batch id",
                      suffix: Icon(Icons.person),
                    ),
                  ),

                  TextFormField(
                    controller: _plan_idcontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Plan id",
                      suffix: Icon(Icons.location_city),
                    ),
                  ),
                  TextFormField(
                    controller: _paid_amountcontriller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Plan Amount",
                      suffix: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    controller: _due_amountcontriller1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Due Amount",
                      suffix: Icon(Icons.phone_android),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _start_joningcontriller1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Stari Joning",
                      suffix: Icon(Icons.person),
                    ),
                  ),
                  // TextFormField(
                  //   controller: _imagecontriller1,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: "Dis Amount",
                  //     suffix: Icon(Icons.person),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: RaisedButton(
                      onPressed: () {
                          SavePlan(
                                  _namecontriller.text.toString(),
                                  _mobilecontriller.text.toString(),
                                  _addresscontriller.text.toString(),
                                  _gendercontriller.text.toString(),
                                  _dobcontriller.text.toString(),
                                  _batch_idcontriller.text.toString(),
                              _plan_idcontriller.text.toString(),
                              _paid_amountcontriller.text.toString(),
                              _due_amountcontriller1.text.toString(),
                              _start_joningcontriller1.text.toString(),
                                  );
                          //     .then((value) {})
                          //     .catchError((e) {
                          //   print(e.toString());
                          // });

                        // submit(_namecontriller.text.toString(), _locationcontriller.text.toString(), _emailcontriller.text.toString(), _mobilecontriller.text.toString(), _vendortypecontriller.text.toString(), _servicenamecontriller.text.toString(), _productnamecontriller.text.toString());
                      },
                      child: Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
