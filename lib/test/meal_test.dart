import 'package:flutter_test/flutter_test.dart';
import 'package:project_1/meal_plan/meal.dart';

void main() {
  test(
    "Test valid Meal", 
    () {
    Meal meal = Meal.fromJson({"id":1, "type":"Breakfast", "combo":"Scammbled eggs, toast, sausage"});
    expect(meal.id, 1);
    expect(meal.type, "Breakfast");
    expect(meal.combo, "Scammbled eggs, toast, sausage");
  }
  );
}
