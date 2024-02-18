import 'package:flutter/material.dart';
import 'package:valorant_wiki/core/app_colors.dart';

class ColorGeneratorModel {
  final Color darkVibrantColor;

  ColorGeneratorModel({Color? darkVibrantColor})
      : darkVibrantColor = darkVibrantColor ?? AppColors.redValorant;
}
