import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({Key? key}) : super(key: key);

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {
  String location = 'Null, Press Button';

  @override
  Widget build(BuildContext context) {
    Future<Position> _getGeoLocationPosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    @override
    void initState() {
      _getGeoLocationPosition();
    }

    return Scaffold(
      appBar: AppBar(
        title: Title(
            color: Colors.white, child: const Text('Welcome to our HomePage')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Coordinates Points',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              location,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  Position position = await _getGeoLocationPosition();
                  setState(() {
                    location =
                        'Latitude: ${position.latitude} , Longitude: ${position.longitude}';
                  });
                  print(location);
                },
                child: const Text('Get Location'))
          ],
        ),
      ),
    );
  }
}
