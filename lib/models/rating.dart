import 'package:flutter/widgets.dart';

class Rating {
  final String email;
  final int foodRating;
  final int environmentRating;
  final int serviceRating;

   Rating({this.email, this.foodRating, this.serviceRating, this.environmentRating});

  Map<String, dynamic> toJson() => {
    'emailConsumer' : email,
    'enviromentRating': environmentRating,
    'foodRating':foodRating ,
    'serviceRating': serviceRating,
  };

}