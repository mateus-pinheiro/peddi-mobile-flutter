import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/item.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';


class OrderList extends StatefulWidget {


  @override
  OrderListState createState() {
    return new OrderListState();
  }
}

class OrderListState extends State<OrderList> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    new Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 55.0,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 23.0),
                          child: Text('Chelsea Burguer',
                              style: FontStyles.orderStatus3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 23.0),
                          child: Text('RS 29,00 cada',
                              style: FontStyles.orderStatus3),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(
                      Icons.remove_circle,
                      color: Colors.black12,
                      size: 55.0,
                    ),
                    Text('5', style: FontStyles.h4),
                    new Icon(
                      Icons.add_circle,
                      color: Colors.black12,
                      size: 55.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 20.0,
          color: Colors.black12,
        ),
      ],
    );
  }



}
