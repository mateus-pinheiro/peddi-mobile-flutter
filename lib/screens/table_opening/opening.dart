import 'package:flutter/material.dart';
import 'package:peddi_tont_app/screens/table_opening/widgets/opening_form.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: ,
      body: Material(
        child: Container(
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('resources/images/waves.png'),
                fit: BoxFit.fill),
          ),
          color: Color(0xffFFCC00),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 20.0,
                        ),
                        child: Container(
                            width: 120.0,
                            height: 90.0,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
//                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(
                                        'resources/images/logo_lm_title.jpg'),
                                    alignment: Alignment(-1.0, -1.0)))),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            right: 20.0,
                          ),
                          child: Image(
                              image: AssetImage('resources/images/logo1.png'),
//                        color: Colors.green,
                              alignment: Alignment(1.0, -1.0),
                              width: 150.0,
                              height: 95.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: OpeningFormRoute(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
//                    height: 80.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 50.0),
                          child: Text(
                            'Ajuda',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CircularStd',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 50.0),
                          child: Text(
                            'Suporte',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CircularStd',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 40.0),
                          child: Text('Reiniciar',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'CircularStd',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
