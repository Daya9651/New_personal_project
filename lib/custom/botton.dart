import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

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

  const CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.image,
    this.imageHeight,
    this.imageWidth
  }) : super(key: key);

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
            Image.asset(image??'', height: imageHeight,width: imageWidth,),
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