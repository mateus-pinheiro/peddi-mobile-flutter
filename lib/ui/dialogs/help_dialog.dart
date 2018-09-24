import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class HelpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 400.0,
            height: 150.0,
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Chame o garçom!',style: FontStyles.style1,),
                  Icon(
                    Icons.tag_faces,
                    color: AppColors.yellow1,
                    size: 35.0,
                  ),
                ],
              ),

          ),
        ],
      ),
    ),
    );
  }
}