import 'package:first_flutter/libs_main/packigist.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}
class _SearchPageState extends State<SearchPage> {

  List _listOne = [
    ['美國流行音樂流行趨勢', "川普當選", '6.04'],
    ['台灣流行音樂流行趨勢', "雞排妹事件", '6.04'],
    ['韓國流行音樂流行趨勢', "整形", '6.04'],
    ['日本流行音樂流行趨勢', "peko~~peko~~", '6.04'],
  ];

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
                              MediaQuery.of(context).size.width * 0.049),
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


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          this._contentList(this._listOne),
        ],
      ),
    );
  }
}
