import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String locationUrl = '';
  Position? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getLocation();
              },
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            if (locationUrl.isNotEmpty)
              TextButton(
                onPressed: () async {
                  checkOfficeLocation(position);
                  // Open the URL in a web browser or WebView.
                  // Example: launch(locationUrl);
                },
                child: Text('Open in Maps'),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );

        setState(() {
          locationUrl =
              'https://www.google.com/maps/search/?api=1&query=${position!.latitude}%2C${position!.longitude}';
        });
      } catch (e) {
        print('Error: $e');
      }
    } else if (status.isDenied) {
      print('Location permission denied by the user. Please grant permission in settings.');
    } else if (status.isPermanentlyDenied) {
      print('Location permission permanently denied. You can request permission in settings.');
    }
  }

  void checkOfficeLocation(Position? position) {
    if (position != null) {
      final officeLatitude = 31.412832874657276;
      final officeLongitude = 73.10322887105852;
      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        officeLatitude,
        officeLongitude,
      );

      if (distance <= 500) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage(status: 'Present'),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextPage(status: 'Absent'),
          ),
        );
      }
    }
  }
}

class NextPage extends StatelessWidget {
  final String status; // Status can be 'Present' or 'Absent'

  NextPage({required this.status});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('Your status: $status'),
      ),
    );
  }
}
