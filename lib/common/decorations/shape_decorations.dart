import 'package:flutter/cupertino.dart';

import '../../const/const_width.dart';
import '../../style/color.dart';

ShapeBorder constShapeBorder() {
  return  RoundedRectangleBorder(side: BorderSide(color: AppColors.white),borderRadius: BorderRadius.circular(w5));
}
