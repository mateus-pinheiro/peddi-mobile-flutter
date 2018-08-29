import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      height: 170.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Container(
              height: 95.0,
              width: 120.0,
//              color: Colors.amberAccent,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('resources/images/logo1.png'))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Container(
              height: 95.0,
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Container(
              height: 95.0,
              width: 150.0,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage(
                          'resources/images/logo_lm_title.jpg'),
//                      alignment: Alignment(-1.0, -1.0)
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Restaurante Madalosso',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'CircularStd',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mesa 230',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'CircularStd',
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      '5 pessoas',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'CircularStd',
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                height: 95.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 40.0),
            child: Container(
              height: 95.0,
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 40.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage('resources/images/help.png'),
//                      alignment: Alignment(-1.0, -1.0)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
