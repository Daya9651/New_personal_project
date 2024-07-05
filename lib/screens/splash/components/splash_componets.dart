import 'package:flutter/material.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        // const Text(
        //   "Likhit de",
        //   style: TextStyle(
        //     fontSize: 32,
        //     color: kPrimaryColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),


        Image.asset(
          widget.image!,
          height: 250,
          width: 400,
        ),
        // const Spacer(flex: 2),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}