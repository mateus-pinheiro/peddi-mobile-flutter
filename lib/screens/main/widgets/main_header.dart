import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MainHeader extends StatelessWidget {
  String showCustomersQty(int customers) {
    if (customers == null) {
      return 'Não preenchido';
    } else if (customers == 1) {
      return customers.toString() + ' pessoa';
    } else {
      return customers.toString() + ' pessoas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, Order>(
      converter: (store) => store.state.order,
      builder: (context, order) => (new Container(
            color: Colors.black,
            height: 160.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                  height: 130.0,
                  color: Colors.black,
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
//                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'resources/images/logo_lm_title.jpg'),
                                ))),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 130.0,
                  width: 25.0,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        'CARDÁPIO',
                        style: FontStyles.style3,
                      ),
                    ),
                  ),
//          color: Colors.blue,
                )),
                Expanded(
                    child: Container(
                  height: 130.0,
                  width: 25.0,
                  color: Colors.black,
//          color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                order.table == null
                                    ? 'Não preenchido'
                                    : 'Mesa ' + order.table.toString(),
                                style: FontStyles.style4),
                            Text(
                              showCustomersQty(order.customers),
                              style: FontStyles.style4,
                            ),
                          ],
                        ),
                      ),
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
                            image: new AssetImage('resources/images/help.png'),
//                      alignment: Alignment(-1.0, -1.0)
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }
}
