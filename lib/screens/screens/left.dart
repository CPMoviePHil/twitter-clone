import 'package:first_flutter/libs_main/packigist.dart';
import 'package:first_flutter/libs_main/libs_export.dart';
import 'package:first_flutter/models/export_class.dart';

class LeftBarScreen extends StatelessWidget {

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

  final String _onlineAvatarPath = 'https://i1.sndcdn.com/artworks-000220681134-i61wr1-t500x500.jpg';

  Widget personalProfile(String onlineImage) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: this.accountProfileImage(this._onlineAvatarPath),
          ),
          Container(
            child: ListTileTheme(
              contentPadding: EdgeInsets.only(
                right: 0,
                left: 0,
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    this.loginNameAndAccountStatus(),
                    AppLibScreen.appIcons(
                      Icons.keyboard_arrow_down_sharp,
                      null,
                      iconColor: Colors.blue,
                    ),
                  ],
                ),
                subtitle: this.loginAccount(),
              ),
            ),
          ),
          Container(
            child: this.followerAndFollowing(),
          ),
        ],
      ),
    );
  }

  Widget accountProfileImage(String onlineImage) {
    return CircleAvatar(
      child: Container(
        child: AppLibScreen.imageContent(
          this._onlineAvatarPath,
        ),
      ),
    );
  }

  Widget loginNameAndAccountStatus() {
    return Row(
      children: [
        AppLibScreen.appText(
          "黃智輝",
        ),
        SizedBox(
          width: 5,
        ),
        AppLibScreen.appIcons(
          Icons.lock,
          null,
        ),
      ],
    );
  }

  Widget loginAccount() {
    return AppLibScreen.appText(
      "@cpmoviephil",
      fontColor: Colors.grey,
      fontSize: 15,
    );
  }

  Widget followerAndFollowing() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppLibScreen.appText("166"),
        SizedBox(
          width: 5,
        ),
        AppLibScreen.appText(
          "個跟隨中",
          fontColor: Colors.grey,
        ),
        SizedBox(
          width: 15,
        ),
        AppLibScreen.appText("40"),
        SizedBox(
          width: 5,
        ),
        AppLibScreen.appText(
          "個跟隨者",
          fontColor: Colors.grey,
        ),
      ],
    );
  }

  Widget leftBarList(mainScreenContext, List leftBarItems, bool needIcon) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: leftBarItems.length,
        itemBuilder: (context, index) {
          return leftBarItemWidget(mainScreenContext, leftBarItems[index], needIcon);
        },
      ),
    );
  }

  Widget leftBarItemWidget(context, LeftBarItems item, bool needIcon) {
    if (needIcon) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLibScreen.appIcons(
              item.icon,
              null,
              size: 25,
              iconColor: Colors.grey,
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
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: this.personalProfile(
                  this._onlineAvatarPath,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: this.leftBarList(context, this._leftBarItems, true),
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
                child: this.leftBarList(context, this._leftBarBottomItems, false),
              ),
            ],
          ),
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
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppLibScreen.appIcons(Icons.lightbulb_outline_sharp, null, iconColor: Colors.blue, size: 25,),
              AppLibScreen.appIcons(Icons.qr_code_outlined, null, iconColor: Colors.blue, size: 25,),
            ],
          ),
        ),
      ],
    );
  }
}