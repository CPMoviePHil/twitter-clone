import 'package:first_flutter/libs_main/common_package.dart';
import 'package:first_flutter/libs_main/libs_export.dart';
import 'package:first_flutter/models/export_class.dart';

class HiddenLeft extends StatelessWidget {

  final List<LeftBarItems> _leftBarItems = [
    LeftBarItems(null, "建立新帳戶"),
    LeftBarItems(null, "加入現有帳戶"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.02,
          decoration: BoxDecoration(
            border: Border(
              bottom: AppLibScreen.appBorder(width: 0.9),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AppLibScreen.leftBarList(context, this._leftBarItems, false),
        ),
      ],
    );
  }
}