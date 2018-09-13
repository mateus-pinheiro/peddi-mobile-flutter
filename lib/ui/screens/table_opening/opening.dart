import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/table_opening/widgets/opening_form.dart';

class Opening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.05), BlendMode.dstATop),
                image: AssetImage('resources/images/tabletimage.png'),
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
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  height: 450.0,
                  width: MediaQuery.of(context).size.width,
                  child: OpeningFormRoute(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
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
                            style: FontStyles.style1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 50.0),
                          child: Text(
                            'Suporte',
                            style: FontStyles.style1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 40.0),
                          child: Text(
                            'Reiniciar',
                            style: FontStyles.style1,
                          ),
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
