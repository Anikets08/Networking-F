import 'package:flutter/material.dart';
import 'package:flutterlogin/common.dart';

void main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
