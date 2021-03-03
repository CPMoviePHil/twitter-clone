import 'package:first_flutter/libs_main/common_package.dart';

class LeftBarItems {
  IconData icon;
  String leftBarItemsName;
  String routes;
  Function onChange;

  LeftBarItems(this.icon, this.leftBarItemsName,);
}

class PageBar {
  String pageBarLabel;
  double fontSize;
  PageBar(this.pageBarLabel);
}