import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/meal_plan/meal.dart';
import 'package:project_1/meal_plan/meal_plan_repository.dart';

import 'meal_repository_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  group("Meal repsoitory", () {
    //successful find getMealById
    test("Sucessful call to getMealByID", () async {
      final client = MockClient();
      MealPlanRepository mealRepo = MealPlanRepository();

      when(client
              .get(Uri.parse("http://localhost:8080/api/v1/meal/breakfast/2")))
          .thenAnswer((_) async => http.Response(
              '{"id":2,"type":"Breakfast","combo":"Sausage, toast, coffee, scrambled eggs"}',
              200));
      Meal meal = await mealRepo.getMealByID(client, 2);
      expect("Sausage, toast, coffee, scrambled eggs", meal.combo);
    });
    //failed find getMealById

    test("Failed call to getMealByID", () {});
  });
}
