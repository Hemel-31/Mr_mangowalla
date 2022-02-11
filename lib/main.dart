import 'package:flutter/material.dart';
import 'pages/splashScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Mr_mangowalla());
}

class Mr_mangowalla extends StatelessWidget {
  const Mr_mangowalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MR.Mangowalla",
        theme: ThemeData(),
        home: SplashScreen(),
      );
    });
  }
}
