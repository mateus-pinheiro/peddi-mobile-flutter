import 'package:flutter/material.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';

typedef void RatingChangeCallback(int rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5, this.rating = 0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme
            .of(context)
            .buttonColor,
        size: 50.0,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color:AppColors.yellow1,
        size: 50.0,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color:AppColors.yellow1,
          size: 50.0,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () =>
          onRatingChanged(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(
        starCount, (index) => buildStar(context, index)));
  }
}

//class Test extends StatefulWidget {
//  @override
//  _TestState createState() => new _TestState();
//}
//
//class _TestState extends State<Test> {
//  double rating = 3.5;
//
//  @override
//  Widget build(BuildContext context) {
//    return new StarRating(
//      rating: rating,
//      onRatingChanged: (rating) => setState(() => this.rating = rating),
//    );
//  }
//}

