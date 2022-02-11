import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:sizer/sizer.dart';
import 'login.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var pages = [
    PageViewModel(
      pageColor: Colors.white,
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: CircleAvatar(),
      // mainImage: Image(
      //   width: 50.w,
      //   image: AssetImage("assets/unnamed.jpg"),
      // ),
      body: const Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      title: const Text('welcome1',
          style: TextStyle(fontSize: 28, color: Colors.black)),
      titleTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
      bodyTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.white,
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: CircleAvatar(
        radius: 10,
      ),
      // mainImage: Image(
      //   width: 50.w,
      //   image: AssetImage("assets/unnamed.jpg"),
      // ),
      body: const Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      title: const Text('welcome2',
          style: TextStyle(fontSize: 28, color: Colors.black)),
      titleTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
      bodyTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.white,
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: CircleAvatar(
        radius: 10,
      ),
      // mainImage: Image(
      //   width: 50.w,
      //   image: AssetImage("assets/unnamed.jpg"),
      // ),
      body: const Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      title: const Text('welcome3',
          style: TextStyle(fontSize: 28, color: Colors.black)),
      titleTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
      bodyTextStyle:
          const TextStyle(fontFamily: 'Poppins', color: Colors.white),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        skipText: Text(
          "Sikp",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        nextText: Text(
          "Next",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        doneText: Text(
          "Done",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        onTapDoneButton: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
      ),
    );
  }
}
