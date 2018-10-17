import 'package:flutter/widgets.dart';

class Rating {
   String email;
   int foodRating;
   int environmentRating;
   int serviceRating;

   Rating({this.email, this.foodRating, this.serviceRating, this.environmentRating});

  Map<String, dynamic> toJson() => {
    'emailConsumer' : email,
    'enviromentRating': environmentRating,
    'foodRating':foodRating ,
    'serviceRating': serviceRating,
  };

}