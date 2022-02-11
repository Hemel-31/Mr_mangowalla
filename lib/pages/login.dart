import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'style.dart';
import 'signupPage.dart';
import 'package:mr_mangowalla_woocommerce/pages/dashboard.dart';
import 'package:mr_mangowalla_woocommerce/pages/customerModel.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome to",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              Text(
                "Mangowala",
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent),
              ),
              Container(
                width: 100.w,
                child: loginform(),
              ),
            ],
          ),
        ),
      )),
    );
  }

  loginform() => Container(
        width: 80.w,
        height: 55.h,
        child: Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login's",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextField(
                  controller: _email,
                  autofocus: false,
                  decoration: Style()
                      .formdec("Mail or Phone", 'Enter your Mail or Phone'),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                  controller: _pass,
                  autofocus: false,
                  decoration:
                      Style().formdec("Password", 'Enter your Password'),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forget Password!",
                    style:
                        TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CupertinoButton(
                    child: Container(
                      width: 100.w,
                      child: Text(
                        "Login".toUpperCase(),
                        style:
                            Style().custom(20.0, FontWeight.w600, Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      login();
                    }),
                SizedBox(
                  height: 4.2.h,
                ),
                Row(
                  children: [
                    Text(
                      "Do not Have account!",
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Sign up!",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignupPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Future<void> login() async {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('http://taj3.xyz/flutter_api/authentication.php'),
          body: ({
            'email': _email.text,
            'password': _pass.text,
          }));
      var jsonrespons = json.decode(response.body);
      print(" data from server Customer data");
      print(jsonrespons);
      bool loginstatas;
      for (var cd in jsonrespons) {
        Login data = new Login(
          success: cd["success"],
          customerDetails: cd["customerDetails"],
          error: cd["error"],
        );
        loginstatas = (data.success) as bool;
        print(loginstatas);
        if (loginstatas == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Dashboard()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Email or password! somthing wrong.")));
        }
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field now Allowed.")));
    }
  }
}



      // for (var cd in jsonrespons) {
      //   Login data = new Login(
      //     success: cd["success"],
      //     customerDetails: cd["customerDetails"],
      //     error: cd["error"],
      //   );
      //   customerLogin.add(data);
      // }
      // if (customerLogin[0].success == true) {
      //   Navigator.push(context, MaterialPageRoute(builder: (_) => Dashboard()));
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Email or password! somthing wrong.")));
      // }
      // print(customerLogin[0].success);