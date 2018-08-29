import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/category.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/screens/menu/widgets/menu_product.dart';

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
//    _selectedSubCategoryColor = Colors.transparent;
//    callback(_selectedSubCategory);
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
      _selectedSubCategory = _selectedCategory.subCategory[0];
      build(context);
    });
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
          child: buildCategoryList(storeCategories),
        ),
        new Container(
          height: 75.0,
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
      },
      child: Container(
//            width: 80.0,
        child: Center(
            child: Text(
          category.name,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        )),
        height: 200.0,
        width: 180.0,
        color: Colors.green,
      ),
    );
  }

  Widget subCategoryItem(SubCategory subCategory) {
    return MaterialButton(
      onPressed: () {
        _selectSubCategory(subCategory);
      },
      child: Container(
        child: Center(
            child: Text(
          subCategory.name,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )),
//        color: Colors.green,
        height: 40.0,
        width: 200.0,
      ),
    );
  }
}
