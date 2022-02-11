import 'package:flutter/material.dart';
import 'package:mr_mangowalla_woocommerce/pages/dashboard.dart';
import 'package:mr_mangowalla_woocommerce/pages/intriPage.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Future.delayed(Duration(seconds: 3)).then((value) => {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => IntroPage()))
        });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/mangoFace.JPG'),
              width: 120,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "MR.MANGOWALLA",
              style: TextStyle(
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
                fontSize: 24,
                color: Colors.grey[800],
              ),
            )
          ],
        )),
        height: 100.h,
      ),
      bottomNavigationBar: Container(
        child: Center(
          child: Text(
            'FROM A4B096',
            style: TextStyle(
              color: Color(0xFFF09439),
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto-Regular',
              letterSpacing: 0.5,
            ),
          ),
        ),
        height: 20.h,
      ),
    );
  }
}
