import 'package:flutter/material.dart';

class GlobalVariable {
  static late double width;
  static late double height;
  GlobalVariable(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
