import 'package:first_flutter/libs_main/common_package.dart';

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
