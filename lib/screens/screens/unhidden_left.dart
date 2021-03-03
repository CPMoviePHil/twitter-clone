import 'package:first_flutter/libs_main/common_package.dart';
import 'package:first_flutter/libs_main/libs_export.dart';
import 'package:first_flutter/models/export_class.dart';

class UnhiddenLeft extends StatelessWidget{

  final List<LeftBarItems> _leftBarItems = [
    LeftBarItems(Icons.person_outline, "個人資料"),
    LeftBarItems(Icons.list_alt_outlined, "列表"),
    LeftBarItems(Icons.chat_outlined, "主題"),
    LeftBarItems(Icons.bookmark_outline_outlined, "書籤"),
    LeftBarItems(Icons.electrical_services_outlined, "新聞"),
    LeftBarItems(Icons.person_add_outlined, "跟隨者請求"),
  ];

  final List<LeftBarItems> _leftBarBottomItems = [
    LeftBarItems(null, "設定與隱私"),
    LeftBarItems(null, "說明中心"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AppLibScreen.leftBarList(context, this._leftBarItems, true),
        ),
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
          child: AppLibScreen.leftBarList(context, this._leftBarBottomItems, false),
        ),
      ],
    );
  }
}