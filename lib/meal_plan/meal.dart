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
<<<<<<< HEAD:lib/mealplan/meal.dart

=======
>>>>>>> 3656bf46ec6889180c875dc7d1c6bbbc3f006e6c:lib/meal_plan/meal.dart
  }

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'combo': combo};
}
