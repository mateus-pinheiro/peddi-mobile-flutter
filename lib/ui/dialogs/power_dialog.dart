import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class PowerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: new Stack(
        children: <Widget>[
          new InkWell(
            onTap: () => Navigator.of(context).pop(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
          ),
          new Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 500.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Text('Você realmente deseja reiniciar o app?',style: FontStyles.productNameMenu,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton (
                              onPressed: () {
                                Navigator.pushNamed(context, '/opening');

                              },
                              color: Colors.green,
                              height: 30.0,
                              minWidth: 30.0,
                              child: Text('SIM',style: FontStyles.style4,),
                            ),
                            MaterialButton (
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                              height: 30.0,
                              minWidth: 30.0,
                              child: Text('NÃO',style: FontStyles.style4,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}