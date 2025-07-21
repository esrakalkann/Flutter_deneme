import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';

void main(List<String> args){

  final model= CarModel(category: Carmodels.bmw, name: 'bmw x5', money: 14234);

final carItems = [

CarModel(category: Carmodels.bmw, name: 'bmwx5', money: 12,isSecondHand: false),
CarModel(category: Carmodels.toyota, name: 'toyota', money: 34),
CarModel(category: Carmodels.bmw, name: 'yamaha', money: 45),
CarModel(category: Carmodels.toyota, name: 'bmwsls', money: 34566, isSecondHand: false),
CarModel(category: Carmodels.bmw, name: 'toyota05', money: 3564),
CarModel(category: Carmodels.bmw, name: 'bmw x5', money: 3564),

];


final isHaveCar= carItems.contains(newCar);

if(isHaveCar){

  print('available');
}
else{

  print('not available');
}


final resultCount=carItems.where((element) => element.isSecondHand==true).length;
print(resultCount) ;
}
final newCar= CarModel(category: Carmodels.bmw, name: 'bmw x5', money: 33);

//final newCar = CarModel(category: Carmodels.bmw, name: 'bmw x5', money: 33);

/*

final resultBMWMorethn20=carItems.where((element){
return element.category == Carmodels.bmw && element.money > 20;
  });

*/

final resultBmwMorethan20 = carItems.where((element){

  return element.category==Carmodels.bmw && element.money > 20;
});



class CarModel {
   Carmodels category;
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


  CarModel copyWith({
    Carmodels? category,
    String? name,
    double? money,
    String? city,
    bool? isSecondHand,
  }) {
    return CarModel(
      category: category ?? this.category,
      name: name ?? this.name,
      money: money ?? this.money,
      city: city ?? this.city,
      isSecondHand: isSecondHand ?? this.isSecondHand,
    );
  }

  

  

 
  @override
  String toString() {
    return 'CarModel(category: $category, name: $name, money: $money, city: $city, isSecondHand: $isSecondHand)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CarModel &&
      other.category == category &&
      other.name == name &&
      other.money == money &&
      other.city == city &&
      other.isSecondHand == isSecondHand;
  }

  @override
  int get hashCode {
    return category.hashCode ^
      name.hashCode ^
      money.hashCode ^
      city.hashCode ^
      isSecondHand.hashCode;
  }
}
enum Carmodels{bmw, yamaha, toyota}