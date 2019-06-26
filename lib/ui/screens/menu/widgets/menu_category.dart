import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:peddi_tont_app/models/app_state.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/featured_list.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/dialogs/advertising_widget.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_product.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:redux/redux.dart';

const double _ITEM_HEIGHT = 70.0;
const String _featuredCategory = "DESTAQUES";
const int TIME_TO_SCROLL = 1000;
const int ITEM_SIZE = 200;

// ignore: must_be_immutable
class MenuCategoryRoute extends StatelessWidget {
  MenuCategoryRoute({this.selectedCategory, this.fromInactivityTimer});

  final Category selectedCategory;
  final bool fromInactivityTimer;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Category>>(
        converter: (store) => store.state.restaurant.categories,
        builder: (context, categories) => MenuCategory(categories,
            selectedCategory: selectedCategory,
            fromInactivityTimer: fromInactivityTimer));
  }
}

class MenuCategory extends StatefulWidget {
  MenuCategory(this.storeCategories,
      {this.selectedCategory, this.fromInactivityTimer});

  final List<Category> storeCategories;
  final Category selectedCategory;
  final bool fromInactivityTimer;

  @override
  _MenuCategoryState createState() => _MenuCategoryState(
      storeCategories, selectedCategory, fromInactivityTimer);
}

class _MenuCategoryState extends State<MenuCategory>
    with SingleTickerProviderStateMixin {
  _MenuCategoryState(
      this.storeCategories, this._selectedCategory, this.fromInactivityTimer);

  final List<Category> storeCategories;
  bool fromInactivityTimer;
  Category _selectedCategory;
  SubCategory _selectedSubCategory;
  ScrollController _scrollController;

  Animation swipeAnimation;
  AnimationController swipeAnimationController;

  double myOpacity;
  Color swipeColor;
  double swipeSize;
  IconData swipeIcon;
  Widget widgetOfProducts;
  bool jumpTo;

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

    if (_selectedCategory == null) _selectedCategory = storeCategories.last;

    _selectedCategory = _selectedCategory;
//    storeCategories.where((category) => category == _selectedCategory ? category.isSelected = true : null);
//    _selectedSubCategory = _selectedCategory.subcategories[0];

    storeCategories.forEach((c) => toFalse(c, _selectedCategory));
    storeCategories.forEach((category) => category == _selectedCategory
        ? category.isSelected = true
        : category.isSelected = false);

    jumpTo = true;

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

//  forAnimation() {
//    for (int i = 0; i > 3; i++) {
//      myOpacity = 1;
//      setState(() {});
//      Timer(
//          Duration(milliseconds: 1500), () => {myOpacity = 0, setState(() {})});
//    }
//  }

  toFalse(Category category, Category _selectedCategory) {
    category.isSelected = false;
    category.isSelectedColor = AppColors.fitfood;
    _selectedCategory.isSelectedColor = AppColors.fitfood1;
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
      if (_selectedCategory.name == _featuredCategory)
        setState(() {
          fromInactivityTimer = true;
        });
      else
        setState(() {
          fromInactivityTimer = false;
        });
//      _selectedSubCategory = _selectedCategory.subcategories[0];
    });
  }

  void _selectColor(Category category) {
    if (category.isSelected != null) {
      category.isSelected = !category.isSelected;

      if (category.isSelected == true) {
        setState(() {
          storeCategories.forEach((c) => toFalse(c, _selectedCategory));
        });
      } else
        category.isSelectedColor = AppColors.yellow1;
    }
  }

  void _selectSubCategory(SubCategory subCategory) {
    setState(() {
      _selectedSubCategory = subCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (fromInactivityTimer && _selectedCategory.name == _featuredCategory) {
      if (jumpTo) {
        Timer(
            Duration(milliseconds: TIME_TO_SCROLL),
            () => _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                curve: Curves.linear,
                duration: Duration(milliseconds: 500)));
      }
      widgetOfProducts = categoryToShowFeatured();
    } else {
      if (jumpTo) {
        Timer(
            Duration(milliseconds: TIME_TO_SCROLL),
            () => _scrollController.jumpTo(
                storeCategories.indexOf(_selectedCategory).toDouble() *
                    ITEM_SIZE));
      }
      widgetOfProducts = categoryToShowProducts();
    }

    // only when on init screen, it is true
    jumpTo = false;
    return screen();
//     scroll to first selected item
//    for (int i = 0; i < storeCategories.length; i++) {
//      if (storeCategories.elementAt(i).isSelected) {
//        _scrollController.animateTo(i * _ITEM_HEIGHT,
//            duration: new Duration(seconds: 2), curve: Curves.ease);
//        break;
//      }
//    }
//    if (fromInactivityTimer)
//      Timer(Duration(milliseconds: TIME_TO_SCROLL), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
//    else
//      Timer(Duration(milliseconds: TIME_TO_SCROLL), () => _scrollController.jumpTo(storeCategories.indexOf(_selectedCategory).toDouble()));

//    if (_selectedCategory.name == _featuredCategory)
//      return categoryToShowFeatured();
//    else
//      return categoryToShowProducts();
  }

  Widget screen() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          height: 100.0,
          color: AppColors.fitfood,
          child: Stack(
            children: <Widget>[
              buildCategoryList(storeCategories),
//              Align(
//                alignment: Alignment.centerRight,
//                child: Icon(
//                  Icons.arrow_forward_ios,
//                  size: 60,
//                  color: AppColors.peddi_white,
//                ),
//              )
            ],
          ),
        ),
        widgetOfProducts
      ],
    );
  }

  Widget buildCategoryList(List<Category> categories) {
    return new ListView.builder(
      controller: _scrollController,
      itemCount: categories.length,
      itemBuilder: (context, position) {
        return categoryItem(categories[position]);
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget categoryToShowProducts() {
    return new StoreConnector<AppState, FeaturedList>(
        converter: (store) => store.state.featuredList,
        builder: (converter, featuredList) {
          var productList;

          if (_selectedCategory.name == _featuredCategory)
            productList = featuredList.products;
          else
            productList = _selectedCategory.products;

          return Expanded(
              child: new Container(child: new MenuProductRoute(productList)));
        });
  }

  Widget categoryToShowFeatured() {
    int _currentProduct = 0;
//    double featuredCategoryIndex = storeCategories
//        .lastIndexWhere((category) => category.name == _featuredCategory)
//        .toDouble();
    SwiperController controller = new SwiperController();

    return Expanded(
        child: new InkWell(
      onTap: () {
        setState(() {
          controller.stopAutoplay();
        });
      },
      child: new StoreConnector<AppState, FeaturedList>(
          converter: (store) => store.state.featuredList,
          builder: (context, featuredList) {
            if (featuredList.products == null ||
                featuredList.products.length < 1) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Text(
                  'Não temos nenhum destaque no momento.',
                  style: FontStyles.advertisingProductTitle,
                ),
              );
            } else {
              return new Swiper(
                itemCount: featuredList.products.length,
                itemBuilder: (context, position) => new AdvertisingWidget(
                      product: featuredList.products[position],
                    ),
                scrollDirection: Axis.horizontal,
                autoplayDisableOnInteraction: true,
                autoplay: true,
                autoplayDelay: 5000,
                duration: 1500,
                containerHeight: 100,
                itemHeight: 100,
                controller: controller,
//                loop: true,
                onIndexChanged: (index) {
                  setState(() {
                    _currentProduct = index;
                  });
                },
                onTap: (teste) {
                  setState(() {
                    controller.stopAutoplay();
                  });
                },
              );
            }
          }),
    ));
  }

  Widget categoryItem(Category category) {
    return categoryItemButton(category);
  }

  Widget categoryItemButton(Category category) {
    return Container(
      width: 200,
      child: MaterialButton(
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
          width: 200.0,
        ),
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

  Widget buildSubCategoryList(List<SubCategory> subCategories) {
    return new ListView.builder(
      itemCount: subCategories.length,
      itemBuilder: (context, position) =>
          subCategoryItem(subCategories[position]),
      scrollDirection: Axis.horizontal,
    );
  }
}
