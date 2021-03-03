import 'common_package.dart';
import 'package:first_flutter/models/export_class.dart';

class AppLibScreen {

  static BorderSide appBorder({double width = 0.2, Color color = const Color.fromRGBO(61, 65, 69, 1),}) {
    return BorderSide(
      width: width,
      color: color,
    );
  }

  static Widget appIcons(IconData icon, Function onChange,
      {Color iconColor = Colors.white, double size = 20, String iconSize = "medium",}) {
    switch(iconSize){
      case "large":
        size = 30;
        break;
      case "small":
        size = 15;
        break;
      case "medium":
        size = 25;
        break;
      default :
        size = 20;
        break;
    }
    return InkWell(
      onTap: onChange,
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }

  static Widget appText(String text, {Color fontColor = Colors.white, double fontSize = 18, String textSize = 'medium',}) {
    switch(textSize){
      case "large":
        fontSize = 25;
        break;
      case "small":
        fontSize = 15;
        break;
      case "medium":
      default :
        fontSize = 18;
        break;
    }
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

  static Widget imageContent(imageOnePath) {
    return CachedNetworkImage(
      imageUrl: imageOnePath,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          image: DecorationImage(
            image: imageProvider,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  static Widget leftBarList(context, List leftBarItems,
      {bool needIcon=false, bool isRoute=false}) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: leftBarItems.length,
        itemBuilder: (context, index) {
          return leftBarItemWidget(context, leftBarItems[index], needIcon, isRoute);
        },
      ),
    );
  }

  static Widget leftBarItemWidget(context, LeftBarItems item, bool needIcon, bool isRoute) {
    if (needIcon) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLibScreen.appIcons(
              item.icon,
              null,
              iconSize: "medium",
            ),
            SizedBox(
              width: 12,
            ),
            AppLibScreen.appText(
              item.leftBarItemsName,
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLibScreen.appText(
              item.leftBarItemsName,
              fontColor: isRoute
                  ? Colors.blue
                  : Colors.white,
            ),
          ],
        ),
      );
    }
  }

  static final AppLibScreen _instance = AppLibScreen._internal();

  factory AppLibScreen() {
    return _instance;
  }

  AppLibScreen._internal();
}