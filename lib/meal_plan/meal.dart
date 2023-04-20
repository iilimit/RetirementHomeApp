import 'dart:core';
import 'dart:math';

class Meal {
  int id = 0;
  String type = "";
  String combo = "";
  Meal();

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    combo = json['combo'];
  }

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'combo': combo};
}
