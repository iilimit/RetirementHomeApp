import 'dart:core';
import 'dart:math';

class Meal {
  int id = 0;
  String type = "";
  String combo = "";
  Meal();

  Meal.fromJson(Map<String, dynamic> json) {
    try{
    id = json['id'];
    type = json['type'];
    combo = json['combo'];
    }
    catch(e){
      throw const FormatException("Meal json is in invalid format");
    }
   
  }

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'combo': combo};
}
