import 'package:first_flutter/libs_main/common_package.dart';
import 'package:first_flutter/libs_main/libs_export.dart';
import 'unhidden_left.dart';
import 'hidden_left.dart';
import 'left_bottom.dart';

class LeftBarScreen extends StatefulWidget {
  @override
  _LeftBarScreen createState() {
    return _LeftBarScreen();
  }
}

class _LeftBarScreen extends State<LeftBarScreen> {

  final String _onlineAvatarPath = 'https://i1.sndcdn.com/artworks-000220681134-i61wr1-t500x500.jpg';
  bool isHidden = false;

  Widget personalProfile() {
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
                      isHidden
                          ? Icons.keyboard_arrow_up_sharp
                          : Icons.keyboard_arrow_down_sharp,
                      changeState,
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
      textSize: "small",
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

  void changeState(){
    setState(() {
      if (this.isHidden) {
        this.isHidden = false;
      } else {
        this.isHidden = true;
      }
    });
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
                child: this.personalProfile(),
              ),
              (this.isHidden) ? HiddenLeft(): UnhiddenLeft() ,
            ],
          ),
        ),
        this.isHidden
            ? Container()
            : LeftBottom(),
      ],
    );
  }
}