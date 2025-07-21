import 'dart:async';

void main(List<String> args){

  //final model= CarModel(category: CarMo, name: name, money: money)

  final carItems=[

CarModel(category: Carmodels.bmw, name: 'bmwx5', money: 12,isSecondHand: false),
CarModel(category: Carmodels.toyota, name: 'toyota', money: 34),
CarModel(category: Carmodels.bmw, name: 'yamaha', money: 45),
CarModel(category: Carmodels.toyota, name: 'bmwsls', money: 34566, isSecondHand: false),
CarModel(category: Carmodels.bmw, name: 'toyota05', money: 3564),



];



final resultCount=carItems.where((element) => element.isSecondHand==true).length;
print(resultCount) ;
}






class CarModel{
  final Carmodels category;
  final String name;
  final double money;
  String? city;
  bool isSecondHand;

  CarModel({
    required this.category,
    required this.name,
    required this.money,
    this.city,
    this.isSecondHand=true,

  });

}
 enum Carmodels{bmw, yamaha, toyota}