import 'package:flutter/material.dart';

import 'signup/signUp.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SignInPage(),
        ),
      ),
    );
  }
}