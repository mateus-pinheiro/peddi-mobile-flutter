import 'package:flutter/material.dart';
import 'package:peddi_tont_app/models/rating.dart';
import 'package:peddi_tont_app/themes/app_colors.dart';
import 'package:peddi_tont_app/themes/font_styles.dart';
import 'package:peddi_tont_app/util/stars.dart';

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => new _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _foodRating = 1;
  int _serviceRating = 1;
  int _environmentRating = 1;

  Rating _rating = new Rating(environmentRating: 1, foodRating: 1,serviceRating: 1);

//  String _subjectName = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: new Stack(
        children: <Widget>[
          new InkWell(
            onTap: () => Navigator.of(context).pop(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          Center(
            child: Container(
              height: 628.0,
              width: 944.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Obrigado pela sua visita, volte sempre!',
                        style: FontStyles.style13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 144.0,
                        width: 800.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: AppColors.yellow1, width: 02.0),
                            color: AppColors.yellow1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.email,
                                size: 60.0,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 300.0,
                                width: 290.0,
                                color: AppColors.yellow1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 05.0),
                                      child: Text(
                                          'Fique por dentro das novidades!',style: FontStyles.style6,),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 05.0,top: 05.0),
                                      child: Text(
                                          'Cadastre-se, torne-se um cliente de fidelidade e receba promoções.',style: FontStyles.style14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Container(
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                                    child: TextField(
//                                      onChanged: (tableNumberCurrent) =>
//                                      this.tableNumber = int.parse(tableNumberCurrent),
//                                      keyboardType: TextInputType.number,
//                                      style: FontStyles.style1,
//              onFieldSubmitted: (tableNumberCurrent) => this.tableNumber = tableNumberCurrent,
                                      decoration: InputDecoration(
                                          labelText: 'Digite seu e-mail',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Conte-nos o que achou da sua experiência:',
                        style: FontStyles.style13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 85.0,
                                height: 80.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.room_service,
                                  size: 90.0,
                                  color: AppColors.gray3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Atendimento',
                                  style: FontStyles.iconNameRating,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: new StarRating(
                                  rating: _serviceRating,
                                  onRatingChanged: (rating) => setState(
                                      () => this._serviceRating = rating),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: 85.0,
                                height: 80.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.restaurant,
                                  size: 90.0,
                                  color: AppColors.gray3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Comida',
                                  style: FontStyles.iconNameRating,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: new StarRating(
                                  rating: _foodRating,
                                  onRatingChanged: (rating) =>
                                      setState(() => this._foodRating = rating),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: 85.0,
                                height: 80.0,
                                color: Colors.white,
                                child: Icon(
                                  Icons.store,
                                  size: 90.0,
                                  color: AppColors.gray3,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Ambiente',
                                  style: FontStyles.iconNameRating,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: new StarRating(
                                  rating: _environmentRating,
                                  onRatingChanged: (rating) => setState(
                                      () => this._environmentRating = rating),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        height: 70.0,
                        width: 250.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.yellow1),
                        child: Center(
                        child: Text('ENVIAR AVALIAÇÃO',style: FontStyles.style2,),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
