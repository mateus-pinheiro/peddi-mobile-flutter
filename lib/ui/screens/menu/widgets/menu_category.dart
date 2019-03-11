import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_product.dart';

const double _ITEM_HEIGHT = 70.0;

class MenuCategory extends StatefulWidget {
  MenuCategory(this._selectedCategory, this.storeCategories);

  final List<Category> storeCategories;
  final Category _selectedCategory;

  @override
  _MenuCategoryState createState() =>
      _MenuCategoryState(storeCategories, _selectedCategory);
}

class _MenuCategoryState extends State<MenuCategory>
    with SingleTickerProviderStateMixin {
  _MenuCategoryState(this.storeCategories, this._selectedCategory);

  final List<Category> storeCategories;
  Category _selectedCategory;
  SubCategory _selectedSubCategory;
  ScrollController _scrollController;

  Animation swipeAnimation;
  AnimationController swipeAnimationController;

  double myOpacity;
  Color swipeColor;
  double swipeSize;
  IconData swipeIcon;

  @override
  void initState() {
    super.initState();
//    swipeColor = Colors.white;
//    swipeSize = 90;
//    swipeIcon = Icons.swap_horizontal_circle;
//    myOpacity = 1;
//    swipeAnimation();
//    swipeAnimationController =
//        AnimationController(duration: Duration(seconds: 10), vsync: this);
//    swipeAnimation = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
//        parent: swipeAnimationController, curve: Curves.fastOutSlowIn));

    _scrollController = new ScrollController();
    _selectedCategory = _selectedCategory;
//    storeCategories.where((category) => category == _selectedCategory ? category.isSelected = true : null);
//    _selectedSubCategory = _selectedCategory.subcategories[0];

    storeCategories.forEach((c) => toFalse(c, _selectedCategory));
    storeCategories.forEach((category) => category == _selectedCategory
        ? category.isSelected = true
        : category.isSelected = false);
//    swipeAnimationController.forward();
  }

//  swipeAnimation() {
//    Timer(
//        Duration(milliseconds: 2000),
//        () => {
//              setState(() {
//                swipeColor = Colors.white;
//                swipeIcon = Icons.swap_horiz;
////                swipeSize = 120.0;
//              }),
//              Timer(Duration(milliseconds: 1000),
//                  () => {myOpacity = 0, setState(() {})}),
//            }
//
////      for (int i = 0; i > 3; i++) {
////        myOpacity = 1;
////        setState(() {});
////        Timer(Duration(seconds: 3), () => {myOpacity = 0, setState(() {})});
////        Timer(Duration(seconds: 3), () => {});
////      }
//        );
//  }

  forAnimation() {
    for (int i = 0; i > 3; i++) {
      myOpacity = 1;
      setState(() {});
      Timer(
          Duration(milliseconds: 1500), () => {myOpacity = 0, setState(() {})});
    }
  }

  toFalse(Category category, Category _selectedCategory) {
    category.isSelected = false;
    category.isSelectedColor = AppColors.fitfood;
    _selectedCategory.isSelectedColor = AppColors.fitfood1;
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
//      _selectedSubCategory = _selectedCategory.subcategories[0];
      build(context);
    });
  }

  void _selectColor(Category category) {
    category.isSelected = !category.isSelected;
    if (category.isSelected == true) {
      setState(() {
        storeCategories.forEach((c) => toFalse(c, _selectedCategory));
      });
    } else
      category.isSelectedColor = AppColors.yellow1;
  }

  void _selectSubCategory(SubCategory subCategory) {
    setState(() {
      _selectedSubCategory = subCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
//     scroll to first selected item
//    for (int i = 0; i < storeCategories.length; i++) {
//      if (storeCategories.elementAt(i).isSelected) {
//        _scrollController.animateTo(i * _ITEM_HEIGHT,
//            duration: new Duration(seconds: 2), curve: Curves.ease);
//        break;
//      }
//    }

    Widget buildCategoryList(List<Category> categories) {
      return new ListView.builder(
        controller: _scrollController,
        itemCount: categories.length,
        itemBuilder: (context, position) => categoryItem(categories[position]),
        scrollDirection: Axis.horizontal,
      );
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          height: 150.0,
          color: AppColors.fitfood,
          child: Stack(
            children: <Widget>[
              buildCategoryList(storeCategories),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 60,
                  color: AppColors.peddi_white,
                ),

              )
//                AnimatedBuilder(
//                  animation: swipeAnimationController,
//                  builder: (BuildContext context, Widget child) {
//                    return new Transform(
//                      transform: Matrix4.translationValues(
//                        swipeAnimation.value * width,
//                        0.0,
//                        0.0,
//                      ),
//                      child: Center(
//                        child: Icon(
//                          Icons.forward,
//                          size: 100,
//                          color: AppColors.peddi_white,
//                        ),
//                      ),
//                    );
//                  },
////                      child: Image(
////                        image: AssetImage('resources/images/swipe-icon.png'),
////                        height: 150.0,
////                        width: 60.0,
////                        fit: BoxFit.fill,
////                      ),
////                      child: Image.asset('resources/images/swipe-icon.png'),
//                )
            ],
          ),

//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//            ],

//          child: buildCategoryList(storeCategories),
        ),

//        new Container(
//          height: 65.0,
//          color: AppColors.gray2,
//          child: buildSubCategoryList(_selectedCategory.subcategories),
//        ),
        new Expanded(
            child: new Container(
                child: new MenuProductRoute(_selectedCategory.products)))
      ],
    );
  }

  Widget buildSubCategoryList(List<SubCategory> subCategories) {
    return new ListView.builder(
      itemCount: subCategories.length,
      itemBuilder: (context, position) =>
          subCategoryItem(subCategories[position]),
      scrollDirection: Axis.horizontal,
    );
  }

  Widget categoryItem(Category category) {
    return categoryItemButton(category);
  }

  Widget categoryItemButton(Category category) {
    return MaterialButton(
      onPressed: () {
        _selectCategory(category);
        _selectColor(category);
      },
      splashColor: Color(0),
      elevation: 10.0,
      color: category.isSelectedColor,
      child: Container(
        child: Center(
            child: Text(
          category.name,
          style: FontStyles.menuCategories,
        )),
        width: 180.0,
      ),
    );
  }

  Widget subCategoryItem(SubCategory subCategory) {
    return MaterialButton(
      onPressed: () {
        _selectSubCategory(subCategory);
      },
      splashColor: Color(0),
      child: Container(
        child: Center(
            child: Text(
          subCategory.name,
          style: FontStyles.style7,
        )),
        height: 60.0,
        width: 180.0,
      ),
    );
  }
}
