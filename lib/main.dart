import 'package:first_flutter/main_lib/common_screen_package.dart';
import 'package:first_flutter/main_screen/export_screen.dart';
import 'package:first_flutter/main_lib/export_lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color.fromRGBO(0, 0, 0, 1);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: PrimaryColor,
        ),
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NumberOneClass(),
    );
  }
}

class NumberOneClass extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<NumberOneClass> {

  List _pageList = [
    HomePage(),
    SearchPage(),
  ];

  int currentPageIndex = 0;

  TextEditingController _textEditingController = new TextEditingController();
  String _onlineAvatarPath = 'https://i1.sndcdn.com/artworks-000220681134-i61wr1-t500x500.jpg';

  List<LeftBarItems> _leftBarItems = [
    LeftBarItems(Icons.person_outline, "個人資料"),
    LeftBarItems(Icons.list_alt_outlined, "列表"),
    LeftBarItems(Icons.chat_outlined, "主題"),
    LeftBarItems(Icons.bookmark_outline_outlined, "書籤"),
    LeftBarItems(Icons.electrical_services_outlined, "新聞"),
    LeftBarItems(Icons.person_add_outlined, "跟隨者請求"),
  ];

  List<LeftBarItems> _leftBarBottomItems = [
    LeftBarItems(null, "設定與隱私"),
    LeftBarItems(null, "說明中心"),
  ];

  Widget _personalProfile(String onlineImage) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              child: Container(
                child: AppLibScreen.imageContent(
                  this._onlineAvatarPath,
                ),
              ),
            ),
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
                    Row(
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
                    ),
                    AppLibScreen.appIcons(
                      Icons.keyboard_arrow_down_sharp,
                      null,
                      iconColor: Colors.blue,
                    ),
                  ],
                ),
                subtitle: AppLibScreen.appText(
                  "@cpmoviephil",
                  fontColor: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftBarList(List leftBarItems, bool needIcon) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: leftBarItems.length,
        itemBuilder: (context, index) {
          return _leftBarItemWidget(leftBarItems[index], needIcon);
        },
      ),
    );
  }

  Widget _leftBarItemWidget(LeftBarItems item, bool needIcon) {
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

  BottomNavigationBarItem _barItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Color.fromRGBO(61, 65, 69, 1),
        size: 32,
      ),
      label: label,
    );
  }

  Widget _homePageAppBar() {
    return AppLibScreen.appText("首頁", fontSize: 25);
  }

  Widget _searchPageAppBar() {
    return TextFormField(
      onChanged: (text) {

      },
      controller: this._textEditingController,
      decoration: InputDecoration(
        hintText: "搜尋 Twitter",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding: new EdgeInsets.symmetric(
          vertical: 11.0,
          horizontal: 18.0,
        ),
        filled: true,
        fillColor: Color.fromRGBO(61, 65, 69, 1),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromRGBO(40, 41, 40, 1)),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromRGBO(40, 41, 40, 1)),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );
  }

  Widget _leftBar() {
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
                child: this._personalProfile(
                  this._onlineAvatarPath,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: this._leftBarList(this._leftBarItems, true),
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
                child: this
                    ._leftBarList(this._leftBarBottomItems, false),
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

  @override
  Widget build(BuildContext context) {
    List<Widget> _appBarWidget = [
      this._homePageAppBar(),
      this._searchPageAppBar(),
      this._homePageAppBar(),
      this._homePageAppBar(),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                child: AppLibScreen.appIcons(
                  Icons.menu,
                  null,
                  iconColor: Colors.blue,
                  size: 30,
                ),
              ),
            );
          },
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.75,
                child: _appBarWidget[this.currentPageIndex],
              ),
            ],
          ),
        ),
      ),
      body: this._pageList[this.currentPageIndex],
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width * 0.7,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: this._leftBar(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: AppLibScreen.appBorder(),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              this.currentPageIndex = index;
            });
          },
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: this.currentPageIndex,
          items: <BottomNavigationBarItem>[
            this._barItem("Home", Icons.home_outlined,),
            this._barItem("Search", Icons.search_outlined,),
            this._barItem("Notification", Icons.notifications_outlined,),
            this._barItem("Mail", Icons.mail_outline,),
          ],
        ),
      ),
    );
  }
}