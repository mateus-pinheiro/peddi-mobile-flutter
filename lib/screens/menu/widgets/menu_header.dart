import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Container(
              height: 130.0,
              width: 25.0,
//          color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Container(
                      height: 95.0,
                      width: 150.0,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                'resources/images/logo_peddi_preto.png'),
//                      alignment: Alignment(-1.0, -1.0)
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0, top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Mesa 230', style: FontStyles.h5),
                        Text(
                          '5 pessoas',
                          style: FontStyles.h5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            child: Container(
              height: 130.0,
              width: 25.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text('CARDÁPIO', style: FontStyles.h1,),
                ),
              ),
//          color: Colors.blue,
            )),
        Expanded(
            child: Container(
              height: 130.0,
              width: 25.0,
//          color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 40.0),
                    child: Container(
                      height: 35.0,
                      width: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 30.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('resources/images/environment.png'),
//                      alignment: Alignment(-1.0, -1.0)
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 30.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('resources/images/help.png'),
//                      alignment: Alignment(-1.0, -1.0)
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
