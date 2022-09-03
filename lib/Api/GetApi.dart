import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/get_customer.dart';

class GetCustomerDetails extends StatefulWidget {
  const GetCustomerDetails({Key? key}) : super(key: key);

  @override
  State<GetCustomerDetails> createState() => _GetCustomerDetailsState();
}

class _GetCustomerDetailsState extends State<GetCustomerDetails> {
  // List<GetCustomer> Data=[];
  Future getdata() async {
    final response = await http
        .get(Uri.parse('https://www.premad.in/GYM/Api/getCustomerDetails'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var message=data['message'];
      if (data['status'] == 'Success') {
        print(message);
        return data['data'];

      } else {
        return Future.error(data['message']);
      }
    } else {
      return Future.error('Server error');
    }
  }

  var data;

  get index => null;

  void initState() {
    getdata().then((value) {
      setState(() {
        data = value;
      });
      print("databnbnb" + data.toString());
    }).catchError((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("datafjmfm " + data.toString());
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              //color: Theme.of(context).textTheme.bodyText1.color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'order_details',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 15,
                color: Theme.of(context).textTheme.bodyText1!.color),
          ),
        ),
        body: data == null
            ? CircularProgressIndicator()
            :

            // FutureBuilder(
            //     future: getdata(),
            //   builder: (context, snapshot) {
            //       if(snapshot.hasData){
            //         return
            Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data[index]['user_id'].toString(),
                            style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).errorColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(data[index]['member_id'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),

                          Text(data[index]['name'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).errorColor)),
                          Text(data[index]['gender'].toString(),
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          Text(
                            data[index]['dob'].toString() == ""
                                ? ""
                                : data[index]['dob'].toString(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          // order.orderDetails[index].variation.length > 0 ?
                          Text(
                            data[index]['created_at'].toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Divider(height: 20),
                        ]);
                  },
                ),
              ));
  }
}
