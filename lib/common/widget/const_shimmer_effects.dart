
import 'package:flutter/material.dart';
import 'package:likhit/style/color.dart';

import '../../const/const_height.dart';
import '../../const/const_width.dart';
import 'const_container.dart';

Widget loadSke() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(5, (index) => shimmerItem()), // Generate multiple shimmer items for better UX
    ),
  );}
Widget shimmerItem() {
  return ConstantContainer(
    radiusBorder: w5, // Use appropriate value
    borderColor: AppColors.white50,
    padding: 3.0, // Use appropriate value
    color: AppColors.white,
    child: ListTile(
      title: Container(
        width: double.infinity,
        height: 10.0,
        color: Colors.grey[300],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h8),
          Container(
            width: double.infinity,
            height: 10.0,
            color: Colors.grey[600],
          ),
          SizedBox(height: h8),
          Container(
            width: 150.0,
            height: 10.0,
            color: Colors.grey[100],
          ),
          SizedBox(height: h8),
          Container(
            width: 100.0,
            height: 10.0,
            color: Colors.grey[300],
          ),
        ],
      ),
    ),
  );
}