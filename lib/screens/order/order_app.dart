import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
class Order extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          height: 693.0,
          width: 545.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Itens do pedido',
                      style: FontStyles.orderStatus1,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 75.0,
                      color: Colors.green,
                      child: Center(
                          child: Text('Em aberto', style: FontStyles.orderStatus2)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 75.0,
                      color: Colors.white10,
                      child: Center(
                          child: Text('Enviados', style: FontStyles.orderStatus2)),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 75.0,
                      color: Colors.white,
                      child: Center(
                          child: Text('PRODUTO', style: FontStyles.orderStatus2)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 75.0,
                      color: Colors.white,
                      child: Center(
                          child: Text('QUANTIDADE', style: FontStyles.orderStatus2)),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
//                        child: OrderList(),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('Total',style: FontStyles.orderStatus2,),
                            Text('RS 129,90',style: FontStyles.orderStatus2,),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 59.0,
                      width: 545.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.green),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 60.0,
                        textTheme: ButtonTextTheme.accent,
                        child: new Text('ENVIAR PEDIDO',
                            style: FontStyles.buttonStyle),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
