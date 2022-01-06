import 'package:flutter/material.dart';
import 'package:flutterlogin/Pages/Home.dart';
import 'package:flutterlogin/Pages/Signin.dart';
import 'package:flutterlogin/Pages/Signup.dart';
import 'package:flutterlogin/Pages/splash.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => SplashScreen(),
  "/signin": (context) => SigninScreen(),
  "/signup": (context) => SignupScreen(),
  "/home": (context) => HomeScreen()
};

TextStyle headerStyle = GoogleFonts.poppins(
    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);

TextStyle normalStyle = GoogleFonts.poppins(fontSize: 18, color: Colors.white);
double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;
double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;

Widget buttonContainer(BuildContext context, String name, Function() onTap) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: fullWidth(context) * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            style: normalStyle.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

Widget textfieldContainer(BuildContext context, bool obscureText, String label,
        TextEditingController controller) =>
    Container(
      height: 50,
      width: fullWidth(context) * 0.7,
      child: TextField(
        style: normalStyle.copyWith(fontWeight: FontWeight.normal),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: normalStyle,
          labelText: label,
        ),
      ),
    );
