
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'auth_service.dart';

class Google_map extends StatefulWidget {
  const Google_map({Key? key}) : super(key: key);

  @override
  State<Google_map> createState() => _Google_mapState();
}

class _Google_mapState extends State<Google_map> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers={};

  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
    });
  }


  @override
  void initState(){
    super.initState();
    checkPermission().then((value) async{
      setState(() {
        getLocation();
      }
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      Expanded(
      child: GoogleMap(
      zoomControlsEnabled: false,
        initialCameraPosition:CameraPosition(
          target: LatLng(48.8561, 2.2930),
          zoom: 12.0,
        ),
        onMapCreated: (GoogleMapController controller){
          _controller = controller;
        },
        markers: _markers,
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
                onPressed: () {
                  AuthService().signOut();
                  // Navigator.pushNamed(context, '/Signup');
                },
                child: Text(
                  "Log out",
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
  Future checkPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
  }
}
