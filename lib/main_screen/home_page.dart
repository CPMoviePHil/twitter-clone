import 'package:first_flutter/main_lib/common_screen_package.dart';
import 'package:first_flutter/main_lib/export_lib.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Container(),
        ],
      ),
    );
  }
}
