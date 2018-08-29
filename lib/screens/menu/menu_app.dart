import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'widgets/menu_header.dart';
import 'widgets/menu_category.dart';
import 'widgets/menu_sub_category.dart';

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
//              width: MediaQuery.of(context).size.width,
              height: 130.0,
              color: AppColors.gray1,
              child: MenuHeader(),
            ),
            Expanded(
              child: Container(
//              width: MediaQuery.of(context).size.width,
                  child: MenuCategoryTeste(selectedCategory,storeCategories),
                  height: 300.0,
                  color: Colors.green),
            ),
//            Expanded(
//              child: Container(
////              width: MediaQuery.of(context).size.width,
////                child: MenuSubCategoryRoute(selectedCategory.subCategory),
//              child: MenuSubCategoryTeste(selectedCategory.subCategory),
//                height: 300.0,
//                  color: Colors.greenAccent
//              ),
//            ),
//            Expanded(
//              child: Container(
//                  color: Colors.white,
//                  child: MenuProductRoute()
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
