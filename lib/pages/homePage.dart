// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:testproject/pages/barcodeScannerPage.dart';
import 'package:testproject/pages/imagePickerPage.dart';
import 'package:testproject/pages/site_webView.dart';
import 'package:testproject/pages/user_current_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 121, 78, 78).withOpacity(.2),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Title(
            color: Colors.white, child: const Text('Welcome to our HomePage')),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    'Scanner',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color.fromARGB(255, 197, 111, 111),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BarcodeScannerPage()));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: FlatButton(
                  child: Text(
                    'Image Picker',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color.fromARGB(255, 197, 111, 111),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ImagePickerPage()));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    'Current location',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color.fromARGB(255, 197, 111, 111),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const UserCurrentLocation()));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    'Site Webview ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color.fromARGB(255, 197, 111, 111),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SiteInWebView()));
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
