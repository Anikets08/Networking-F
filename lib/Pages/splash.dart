import 'package:flutter/material.dart';
import 'package:flutterlogin/common.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: fullHeight(context),
          width: fullWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/man.png", width: 170),
              SizedBox(height: 100),
              Text("Welcome to the Login App",
                  style: headerStyle, textAlign: TextAlign.center),
              SizedBox(height: 100),
              Hero(
                tag: "signin",
                child: buttonContainer(context, "Sign in", () {
                  Navigator.pushNamed(context, "/signin");
                }),
              ),
              SizedBox(height: 10),
              Hero(
                tag: "signup",
                child: buttonContainer(context, "Sign up", () {
                  Navigator.pushNamed(context, "/signup");
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
