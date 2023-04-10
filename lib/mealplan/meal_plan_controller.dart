import 'package:project_1/mealplan/meal_plan_repository.dart';

import 'meal.dart';

class MealPlanController {
  MealPlanController();
  final MealPlanRepository _mealPlanRepo = MealPlanRepository();

  Future<List<Meal>> getAllMeals() {
    return _mealPlanRepo.getAllMeals();
  }
}
