import 'package:flutter/material.dart';
import 'package:likhit/style/color.dart';

import '../const/const_height.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;
  bool? backgroundFalse = false;

  CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.backgroundColor,
      this.backgroundFalse,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h55,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.info80,
          // backgroundFalse == false ? AppColors.info80 : backgroundColor,
          // elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
            color: color,
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final String? image;
  final double? imageHeight;
  final double? imageWidth;

  const CustomButton2(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.image,
      this.imageHeight,
      this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          // elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image ?? '',
              height: imageHeight,
              width: imageWidth,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
