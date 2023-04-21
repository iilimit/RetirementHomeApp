import 'package:flutter_test/flutter_test.dart';
import 'package:project_1/meal_plan/meal.dart';

void main() {
  group("Meal test", () { 
    test(
      "Test valid Meal json", 
      () {
      Meal meal = Meal.fromJson({"id":1, "type":"Breakfast", "combo":"Scammbled eggs, toast, sausage"});
      expect(meal.id, 1);
      expect(meal.type, "Breakfast");
      expect(meal.combo, "Scammbled eggs, toast, sausage");
    }
    );
    test(
      "Test invalid Meal json", 
      () {
      expect(() => Meal.fromJson({"id":1, "type":2, "combo":"Scammbled eggs, toast, sausage"}), throwsA(isA<FormatException>()));
    }
    );
    test(
      "Test valid JSON string", 
      () {
      Meal meal = Meal();
      meal.id = 1;
      meal.type = 'Breakfast';
      meal.combo = 'Scammbled eggs, toast, sausage';
      expect({'id': 1, 'type': 'Breakfast', 'combo': 'Scammbled eggs, toast, sausage'}, meal.toJson());
    }
    );
  }
  );

}
