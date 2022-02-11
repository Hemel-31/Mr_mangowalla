import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'style.dart';
import 'package:mr_mangowalla_woocommerce/pages/dashboard.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
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
        height: 70.h,
        child: Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextField(
                  controller: _name,
                  autofocus: false,
                  decoration:
                      Style().formdec("Full Name", 'Enter your Full Name'),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                  controller: _email,
                  autofocus: false,
                  decoration: Style().formdec("Mail", 'Enter your Mail '),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                  controller: _phone,
                  autofocus: false,
                  decoration:
                      Style().formdec("Phone No.", 'Enter your Phone no. '),
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
                  height: 2.0.h,
                ),
                CupertinoButton(
                    child: Container(
                      width: 100.w,
                      child: Text(
                        "Sing up".toUpperCase(),
                        style:
                            Style().custom(20.0, FontWeight.w600, Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      signup();
                    }),
                SizedBox(
                  height: 3.5.h,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign In!",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                            (route) => false);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Future<void> signup() async {
    if (_name.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        _pass.text.isNotEmpty &&
        _phone.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('http://taj3.xyz/flutter_api/generate_customer.php'),
          body: ({
            'full_name': _name.text,
            'email': _email.text,
            'password': _pass.text,
            'phone': _phone.text,
          }));
      if (response.statusCode == 201) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password Must be 8 digit.")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field now Allowed.")));
    }
  }
}
