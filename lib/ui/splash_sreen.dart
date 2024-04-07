
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 50), (Timer timer) {
      if (progress >= 1) {
        timer.cancel();
        Navigator.pushNamed(context, "/login");
      } else {
        setState(() {
          progress += 0.01; 
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icono de carga
            SvgPicture.asset('assets/cv.svg', height: 250), 
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0), 
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), 
              ),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
            
            SizedBox(height: 10), 
            Text('${(progress * 100).round()}%', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}