import 'package:flutter/material.dart';
import 'package:peddi_tont_app/screens/lists/icon_text.dart';

class ElevatedButton extends StatelessWidget {
  const ElevatedButton(
      {@required this.label, @required this.onPressed, this.icon, this.color});

  final Color color;
  final IconData icon;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color ?? Theme.of(context).buttonColor,
      child: icon != null
          ? IconText(
        icon: icon,
        text: label,
      )
          : Text(label),
      textColor: Colors.white,
      elevation: 4.0,
      onPressed: () => this.onPressed(),
    );
  }
}
