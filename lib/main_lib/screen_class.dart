import 'common_screen_package.dart';

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
  PageBar(this.pageBarLabel, this.fontSize,);
}