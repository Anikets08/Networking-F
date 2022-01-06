import 'package:flutter/material.dart';
import 'package:flutterlogin/Controller/Authentications.dart';
import 'package:flutterlogin/common.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: fullHeight(context),
          width: fullWidth(context),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/login.png",
                  width: 300,
                ),
                textfieldContainer(context, false, "Email Id", emailController),
                SizedBox(height: 20),
                textfieldContainer(
                    context, true, "Password", passwordController),
                SizedBox(height: 40),
                Hero(
                    tag: "signin",
                    child: buttonContainer(context, "Sign In", () {
                      Authentication.signIn();
                    })),
                SizedBox(height: 30),
                Text("Forgot Password", style: normalStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
