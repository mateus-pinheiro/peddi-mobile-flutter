import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/order.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/dialogs/help_dialog.dart';
import 'package:peddi_tont_app/ui/dialogs/power_dialog.dart';
import 'package:peddi_tont_app/ui/dialogs/rating_dialog.dart';
import 'package:peddi_tont_app/ui/screens/order/order_app.dart';

class MenuHeader extends StatelessWidget {
  showOrder(BuildContext context) {
    showDialog(context: context, builder: (context) => new OrderApp());
  }
  showHelp(BuildContext context) {
    showDialog(context: context,builder: (context) => new HelpDialog());
  }
  showPower(BuildContext context) {
    showDialog(context: context,builder: (context) => new PowerDialog());
  }
  showRating(BuildContext context) {
    showDialog(context: context,builder: (context) => new RatingDialog());
  }


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
      builder: (context, order) => new Container(
            color: Colors.black,
            height: 160.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Container(
                  height: 130.0,
                  width: 200.0,
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
                ),
                 Container(
                  height: 130.0,
                  width: 550.0,
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
                ),
                Expanded(
                    child: Container(
                  height: 130.0,
                  width: 25.0,
                  color: Colors.black,
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
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton (
                              onPressed: () {
                                Navigator.pushNamed(context, '/main');
                              },
                              splashColor: Color(0),
                              height: 30.0,
                              minWidth: 30.0,
                              child: Icon (
                                Icons.home,
                                size: 60.0,
                                color: AppColors.gray2,
                              ),
                            ),

//                          Text(
//                            'Início',
//                            style: FontStyles.style2,
//                          ),
                          ],
                        ),
                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(bottom: 25.0),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: <Widget>[
//                            MaterialButton (
//                              onPressed: () {
//                                showHelp(context);
//                              },
//                              splashColor: Color(0),
//                              height: 30.0,
//                              minWidth: 30.0,
//                              child: Icon (
//                                Icons.help_outline,
//                                size: 55.0,
//                                color: AppColors.gray2,
//                              ),
//                            ),
//
////                          Text(
////                            'Ajuda',
////                            style: FontStyles.style2,
////                          ),
//                          ],
//                        ),
//                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton (
                              onPressed: () {
                                showRating(context);
                              },
                              splashColor: Color(0),
                              height: 30.0,
                              minWidth: 30.0,
                              child: Icon (
                                Icons.thumbs_up_down,
                                size: 55.0,
                                color: AppColors.gray2,
                              ),
                            ),

//                          Text(
//                            'Ajuda',
//                            style: FontStyles.style2,
//                          ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            MaterialButton (
                              onPressed: () {
                                showPower(context);
                              },
                              splashColor: Color(0),
                              height: 30.0,
                              minWidth: 30.0,
                              child: Icon (
                                Icons.power_settings_new,
                                size: 55.0,
                                color: AppColors.gray2,
                              ),
                            ),

//                          Text(
//                            'Ajuda',
//                            style: FontStyles.style2,
//                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
    );
  }
}
