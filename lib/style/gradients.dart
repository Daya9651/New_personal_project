import 'package:flutter/material.dart';
import 'package:likhit/style/color.dart';

const orangeGradient =  LinearGradient(
  colors: [
    Color(0xFFF43F5E), // Rose

    Color(0xFF0EA5E9), // Sky
    Color(0xFFF97316), // Orange
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const primaryGradientColor =  LinearGradient(
  colors: [
    Color(0xFFa152cd),
    Color(0xFFe1654d),


  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const greyGradientColor =  LinearGradient(
  colors: [
 AppColors.info80,
    AppColors.white,
    // Color(0xFFe1654d),


  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);