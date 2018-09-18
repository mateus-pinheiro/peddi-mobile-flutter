import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/ui/screens/order/order_app.dart';
import 'widgets/menu_header.dart';
import 'widgets/menu_category.dart';
import 'widgets/menu_sub_category.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';

class MenuApp extends StatelessWidget {
  final Category selectedCategory;
  final List<Category> storeCategories;

  MenuApp(this.selectedCategory, this.storeCategories);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130.0,
              color: AppColors.gray1,
              child: MenuHeader(),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      child:
                          MenuCategoryTeste(selectedCategory, storeCategories),
                      height: 600.0,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                        child: new FloatingActionButton.extended(
                          onPressed: () {
                            showOrder(context);
                          },
                          isExtended: true,
                          backgroundColor: AppColors.yellow1,
                          icon: new Icon(
                            Icons.shopping_cart,
                            color: AppColors.gray2,
                            size: 40.0,
                          ),
                          label: Text(
                            'CARRINHO',
                            style: FontStyles.style2,
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showOrder(BuildContext context) {
    showDialog(context: context, builder: (context) => new OrderApp());
  }
}
