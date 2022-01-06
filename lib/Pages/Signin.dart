import 'package:flutter/material.dart';
import 'package:flutterlogin/ApiController/Authentications.dart';
import 'package:flutterlogin/Provider/SigninProvider.dart';
import 'package:flutterlogin/common.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Signin"),
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<SigninProvider>(
          create: (context) => SigninProvider(),
          child: Container(
            height: fullHeight(context),
            width: fullWidth(context),
            child:
                Consumer<SigninProvider>(builder: (context, provider, child) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/login.png",
                      width: 300,
                    ),
                    textfieldContainer(
                        context, false, "Email Id", emailController),
                    SizedBox(height: 20),
                    textfieldContainer(
                        context, true, "Password", passwordController),
                    SizedBox(height: 40),
                    Hero(
                        tag: "signin",
                        child: provider.isLoading
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.black,
                                ),
                              )
                            : buttonContainer(context, "Sign In", () {
                                provider.isLoadingFun(true);
                                Authentication.signIn(
                                        email: emailController.value.text,
                                        password: passwordController.value.text)
                                    .then(
                                  // ignore: avoid_print
                                  (value) => ({
                                    if (value["authenticated"])
                                      {
                                        showSnakBar(Colors.green,
                                            "Authenticated", context),
                                        provider.isLoadingFun(false),
                                      }
                                    else
                                      {
                                        showSnakBar(
                                            Colors.red,
                                            "There's some issue while authenticating the user",
                                            context),
                                        provider.isLoadingFun(false),
                                      }
                                  }),
                                );
                              })),
                    SizedBox(height: 30),
                    Text("Forgot Password", style: normalStyle)
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
