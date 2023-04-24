import 'package:project_1/meal_plan/meal_plan_repository.dart';
import 'package:http/http.dart' as http;
import 'meal.dart';

class MealPlanController {
  MealPlanController();
  final MealPlanRepository _mealPlanRepo = MealPlanRepository();

  Future<List<Meal>> getAllMeals() {
    return _mealPlanRepo.getAllMeals();
  }

  Future<List<Meal>> getAllBreakfast() {
    return _mealPlanRepo.getAllBreakfast();
  }

  Future<Meal> getMealByID(int id) {
    return _mealPlanRepo.getMealByID(http.Client(), id);
  }
}
