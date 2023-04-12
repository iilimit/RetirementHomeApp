import 'dart:core';
import 'dart:math';

class Meal {
  int id = 0;
  String type = "";
  String combo = "";
  Meal();

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    log(id);
    type = json['type'];
    // log("Type: $type");
    combo = json['combo'];
    // log("Combo: $combo");
  }

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'combo': combo};
}
