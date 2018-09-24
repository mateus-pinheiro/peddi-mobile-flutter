import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_product.dart';

class MenuCategoryTeste extends StatefulWidget {
  MenuCategoryTeste(this._selectedCategory, this.storeCategories);

  final List<Category> storeCategories;
  final Category _selectedCategory;

  @override
  _MenuCategoryState createState() =>
      _MenuCategoryState(storeCategories, _selectedCategory);
}

class _MenuCategoryState extends State<MenuCategoryTeste> {
  _MenuCategoryState(this.storeCategories, this._selectedCategory);

  final List<Category> storeCategories;
  Category _selectedCategory;
  SubCategory _selectedSubCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = _selectedCategory;
    _selectedSubCategory = _selectedCategory.subCategory[0];

    storeCategories.forEach((c) => toFalse(c, _selectedCategory));
  }

  toFalse(Category category, Category _selectedCategory) {
    category.isSelected = false;
    category.isSelectedColor = AppColors.yellow1;
    _selectedCategory.isSelectedColor = AppColors.gray2;
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
      _selectedSubCategory = _selectedCategory.subCategory[0];
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
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          height: 75.0,
          color: AppColors.yellow1,
          child: buildCategoryList(storeCategories),
        ),
        new Container(
          height: 65.0,
          color: AppColors.gray2,
          child: buildSubCategoryList(_selectedCategory.subCategory),
        ),
        new Expanded(
            child: new Container(
                child: new MenuProductRoute(_selectedSubCategory.products)))
      ],
    );
  }

  Widget buildCategoryList(List<Category> categories) {
    return new ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, position) => categoryItem(categories[position]),
      scrollDirection: Axis.horizontal,
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
