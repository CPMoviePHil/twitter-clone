import 'package:first_flutter/libs_main/packigist.dart';
import 'package:first_flutter/screens/export_screen.dart';
import 'package:first_flutter/libs_main/libs_export.dart';
import 'package:first_flutter/models/screens/navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color.fromRGBO(0, 0, 0, 1);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: PrimaryColor,
        ),
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EntryPointClass(),
    );
  }
}

class EntryPointClass extends StatefulWidget {
  @override
  _EntryPointState createState() {
    return _EntryPointState();
  }
}

class _EntryPointState extends State<EntryPointClass> {

  int currentPageIndex = 0;

  List _pageList = [
    HomePage(),
    SearchPage(),
  ];

  List _pageAppBarContent = [
    PageBar('首頁', 25,),
    PageBar('搜尋', 25,),
    PageBar('通知', 25,),
    PageBar('信箱', 25,),
  ];

  TextEditingController _textEditingController = new TextEditingController();

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

  Widget pageAppBar(int pageIndex, PageBar appContent) {
    if (pageIndex == 1) {
      return this._searchPageAppBar();
    } else {
      return AppLibScreen.appText(
        appContent.pageBarLabel,
        fontSize: appContent.fontSize,
      );
    }
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

  @override
  Widget build(BuildContext context) {
    List<Widget>_appBarWidget = this._pageAppBarContent.map((e) => this.pageAppBar(
      this.currentPageIndex,
      this._pageAppBarContent[currentPageIndex],
    ),).toList();
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
              child: LeftBarScreen(),
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