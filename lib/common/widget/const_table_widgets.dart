import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:likhit/const/const_width.dart';

import '../../style/color.dart';
import '../../style/text_style.dart';

Widget responsiveDataTable({
  required List<DataColumn> columns,
  required List<DataRow> rows,
  double cellHeight = 50.0,
  double? sizeWidth,
  double? columnSpacing,
  Color? color,
}) {
  return SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        // width: sizeWidth ?? double.infinity,
        width: sizeWidth ?? Get.width,
        child: DataTable(
          // Adjust column spacing as needed
          horizontalMargin: 0,
          columnSpacing: columnSpacing,
          // headingRowHeight: 90.0,
          // dataRowHeight: cellHeight,
          // Adjust the height of the cells
          border: const TableBorder(
            top: BorderSide(width: 0.5),
            right: BorderSide(width: 0.5),
            bottom: BorderSide(width: 0.5),
            left: BorderSide(width: 0.5),
            verticalInside: BorderSide(width: 1, color: AppColors.white40),
          ),
          headingRowColor: MaterialStateColor.resolveWith(
            (states) => color ?? AppColors.primary700,
          ),
          headingTextStyle: AppTextStyles.kBody15RegularTextStyle
              .copyWith(color: AppColors.white),
          columns: columns,
          rows: rows,
        ),
      ),
    ),
  ).paddingSymmetric(horizontal: w3);
}
