import 'package:final_assignment/app/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KAppBarTheme {
  KAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 166, 196, 245), size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 177, 213, 244)),
  );
}
