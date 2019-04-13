import 'package:flutter/widgets.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

class ScrollBar extends StatefulWidget {
  final Widget child;

  ScrollBar({this.child});

  @override
  _ScrollBarState createState() => new _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {

  double _barOffset;

  @override
  void initState() {
    super.initState();
    _barOffset = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
