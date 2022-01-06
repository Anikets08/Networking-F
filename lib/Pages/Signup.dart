import 'package:flutter/material.dart';
import 'package:flutterlogin/ApiController/Authentications.dart';
import 'package:flutterlogin/Provider/SignupProvider.dart';
import 'package:flutterlogin/common.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Sign Up',
        ),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<SignupProvider>(
          create: (context) => SignupProvider(),
          child: Container(
            height: fullHeight(context),
            width: fullWidth(context),
            child:
                Consumer<SignupProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/yo.png", width: 100),
                      SizedBox(height: 50),
                      textfieldContainer(context, false, "First Name", _fName),
                      SizedBox(height: 15),
                      textfieldContainer(context, false, "Last Name", _lName),
                      SizedBox(height: 15),
                      textfieldContainer(context, false, "Email id", _email),
                      SizedBox(height: 15),
                      textfieldContainer(context, false, "Password", _password),
                      SizedBox(height: 15),
                      textfieldContainer(
                          context, false, "Confirm Password", _cPassword),
                      SizedBox(height: 15),
                      Text(
                        _password.value.text == _cPassword.value.text
                            ? ""
                            : "Passwords do not match",
                        style: normalStyle.copyWith(fontSize: 12),
                      ),
                      SizedBox(height: 50),
                      Hero(
                          tag: "signup",
                          child: buttonContainer(context, "Sign up", () {
                            provider.isLoadingFun(true);
                            Authentication.signup(
                              fName: _fName.value.text,
                              lName: _lName.value.text,
                              email: _email.value.text,
                              password: _password.value.text,
                            )
                                .then((value) => value["status"] == 200
                                    ? showSnakBar(
                                        Colors.green,
                                        "Registration Successfull, Now Login",
                                        context)
                                    : showSnakBar(
                                        Colors.red, value["message"], context))
                                .whenComplete(
                                    () => provider.isLoadingFun(false));
                          })),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
