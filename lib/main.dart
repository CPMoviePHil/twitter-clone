import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  TextEditingController _textEditingController = new TextEditingController();
  int _numberOfReviews = 0;
  String _stringOfScore = '0.0';
  double _score = 0.0;
  String title1 = "fuck you";
  String _onlineAvatarPath =
      'https://i1.sndcdn.com/artworks-000220681134-i61wr1-t500x500.jpg';

  List _listOne = [
    ['美國流行音樂流行趨勢', "川普當選", '6.04'],
    ['台灣流行音樂流行趨勢', "雞排妹事件", '6.04'],
    ['韓國流行音樂流行趨勢', "整形", '6.04'],
    ['日本流行音樂流行趨勢', "peko~~peko~~", '6.04'],
  ];

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

  Widget tutorialOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${this._stringOfScore}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              (this._score > 1) ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            Icon(
              (this._score > 2) ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            Icon(
              (this._score > 3) ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            Icon(
              (this._score > 4) ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
            Icon(
              (this._score > 5) ? Icons.star : Icons.star_border,
              color: Colors.amber,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("${this._numberOfReviews} 評論")],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {
                  this._numberOfReviews++;
                  print(_numberOfReviews);
                  setState(() {});
                },
                child: Text('更新評論'),
              ),
              RaisedButton(
                onPressed: () {
                  this._score = (this._score <= 4.9)
                      ? this._score + 0.1
                      : this._score + 0;
                  this._stringOfScore = this._score.toStringAsFixed(1);
                  setState(() {});
                },
                child: Text('評分點擊'),
              ),
            ],
          ),
        ),
        Container(
          child: CachedNetworkImage(
            imageUrl: "https://pbs.twimg.com/media/EuQVCsAUYAAd3pW?format=jpg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        )
      ],
    );
  }

  Widget _contentList(List data) {
    return Container(
      child: ListView.builder(
        itemCount: _listOne.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(61, 65, 69, 1),
                  width: 0.5,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.12,
            child: ListTile(
              subtitle: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${index + 1} · ${data[index][0]}",
                          style: TextStyle(
                            color: Color.fromRGBO(61, 65, 69, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "#${data[index][1]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${data[index][2]}萬 推文",
                          style: TextStyle(
                            color: Color.fromRGBO(61, 65, 69, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: Icon(
                Icons.add_outlined,
                color: Color.fromRGBO(61, 65, 69, 1),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imageContent(imageOnePath) {
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

  Widget _appText(String text,
      {Color fontColor = Colors.white, double fontSize = 18}) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
      ),
    );
  }

  Widget _appIcons(
    IconData icon,
    Function onChange, {
    Color iconColor = Colors.white,
    double size = 20,
  }) {
    return InkWell(
      onTap: onChange,
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }

  BorderSide _appBorder({
    double width = 0.2,
    Color color = const Color.fromRGBO(61, 65, 69, 1),
  }) {
    return BorderSide(
      width: width,
      color: color,
    );
  }

  Widget _personalProfile(String onlineImage) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: CircleAvatar(
              child: Container(
                child: this._imageContent(this._onlineAvatarPath),
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
                        this._appText(
                          "黃智輝",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        this._appIcons(
                          Icons.lock,
                          null,
                        ),
                      ],
                    ),
                    this._appIcons(Icons.keyboard_arrow_down_sharp, null,
                        iconColor: Colors.blue),
                  ],
                ),
                subtitle: this._appText("@cpmoviephil",
                    fontColor: Colors.grey, fontSize: 15),
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                this._appText("166"),
                SizedBox(
                  width: 5,
                ),
                this._appText(
                  "個跟隨中",
                  fontColor: Colors.grey,
                ),
                SizedBox(
                  width: 15,
                ),
                this._appText("40"),
                SizedBox(
                  width: 5,
                ),
                this._appText(
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
            this._appIcons(
              item.icon,
              null,
              size: 25,
              iconColor: Colors.grey,
            ),
            SizedBox(
              width: 12,
            ),
            this._appText(
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
            this._appText(
              item.leftBarItemsName,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Container(
                        child: this._imageContent(this._onlineAvatarPath),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                width: MediaQuery.of(context).size.width * 0.65,
                child: TextField(
                  onChanged: (text) {
                    print("_text:${this._textEditingController.text}");
                  },
                  controller: this._textEditingController,
                  decoration: InputDecoration(
                    hintText: "搜尋",
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color.fromRGBO(94, 94, 94, 1),
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
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  child: Icon(Icons.settings, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.black,
            ),
            this._contentList(this._listOne),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width * 0.7,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
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
                              bottom: this._appBorder(width: 0.9),
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
                        bottom: this._appBorder(width: 0.9),
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
                        this._appIcons(Icons.lightbulb_outline_sharp, null, iconColor: Colors.blue, size: 25,),
                        this._appIcons(Icons.qr_code_outlined, null, iconColor: Colors.blue, size: 25,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: this._appBorder(),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromRGBO(61, 65, 69, 1),
                size: 36,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(61, 65, 69, 1),
                size: 36,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Color.fromRGBO(61, 65, 69, 1),
                size: 36,
              ),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail_outline,
                color: Color.fromRGBO(61, 65, 69, 1),
                size: 36,
              ),
              label: 'School',
            ),
          ],
          currentIndex: 1,
        ),
      ),
    );
  }
}

class LeftBarItems {
  IconData icon;
  String leftBarItemsName;
  String routes;
  Function onChange;

  LeftBarItems(this.icon, this.leftBarItemsName);
}
