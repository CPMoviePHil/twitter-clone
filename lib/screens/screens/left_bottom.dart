import 'package:first_flutter/libs_main/common_package.dart';
import 'package:first_flutter/libs_main/screen.dart';

class LeftBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.02,
          decoration: BoxDecoration(
            border: Border(
              bottom: AppLibScreen.appBorder(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppLibScreen.appIcons(Icons.lightbulb_outline_sharp, null, iconColor: Colors.blue, iconSize: "medium",),
              AppLibScreen.appIcons(Icons.qr_code_outlined, null, iconColor: Colors.blue, iconSize: "medium",),
            ],
          ),
        ),
      ],
    );
  }
}