import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  static const routeName = '/student/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('#Ons App se naam#'),
        ),
        body: Center(
          child: Text('This is the Student Home Page'),
        ));
  }
}
