import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/sub_category.dart';
import 'package:peddi_tont_app/ui/screens/menu/widgets/menu_product.dart';

class MenuSubCategoryTeste extends StatefulWidget {
  MenuSubCategoryTeste(this.subCategories);

  final List<SubCategory> subCategories;

  _MenuSubCategoryTesteState createState() =>
      _MenuSubCategoryTesteState(subCategories);
}

class _MenuSubCategoryTesteState extends State<MenuSubCategoryTeste> {
  _MenuSubCategoryTesteState(this.subCategories);

  List<SubCategory> subCategories;
  SubCategory _selectedSubCategory;

//  Color _selectedSubCategoryColor;

  @override
  void initState() {
    super.initState();
    _selectedSubCategory = subCategories[0];
//    _selectedSubCategoryColor = Colors.transparent;
//    callback(_selectedSubCategory);
  }

  void _selectSubCategory(SubCategory subCategory) {
    setState(() {
      _selectedSubCategory = subCategory;
//      _selectedSubCategoryColor = Colors.red;
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
          child: buildSubCategoryList(subCategories),
        ),
        new Expanded(
            child: new Container(
                child: new MenuProductRoute(_selectedSubCategory.products)))
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

class MenuSubCategoryStateless extends StatelessWidget {
  MenuSubCategoryStateless(this.subCategories);

  final List<SubCategory> subCategories;
  SubCategory _selectedSubCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new MenuSubCategoryTeste(
      subCategories,
    ));
  }

//
//  Widget buildSubCategoryList(List<SubCategory> subCategories) {
//    return new ListView.builder(
//      itemCount: subCategories.length,
//      itemBuilder: (context, position) =>
//          subCategoryItem(subCategories[position]),
//      scrollDirection: Axis.horizontal,
//    );
//  }
//
//  Widget subCategoryItem(SubCategory subCategory) {
//    return MaterialButton(
//      onPressed: () {
//        //_selectSubCategory(subCategory);
//      },
//      child: Container(
//        child: Center(
//            child: Text(
//          subCategory.name,
//          style: TextStyle(color: Colors.white, fontSize: 20.0),
//        )),
////        color: Colors.green,
//        height: 40.0,
//        width: 200.0,
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        new Container(
//          height: 75.0,
//          child: buildSubCategoryList(subCategories),
//        ),
//        new Expanded(
//            child: new Container(
//                child: new MenuProductRoute(subCategories[0].products)))
//      ],
//    );
//  }

}
