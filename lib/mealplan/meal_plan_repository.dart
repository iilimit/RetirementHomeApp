import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'meal.dart';

class MealPlanRepository {
  var httpStatusCodes = <int, String>{
    405: "This operation is not supported.",
    500: "Server encoutered issues.",
    201: "New resource created",
    404: "resource does not exist"
  };
  Future<List<Meal>> getAllMeals() async {
    try {
      var url = Uri.parse("http://localhost:8080/api/v1/meal/breakfast");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Iterable meallistiterablejson = jsonDecode(response.body);
        log(response.body);
        List<Meal> mealList = List<Meal>.from(
            meallistiterablejson.map((data) => Meal.fromJson(data)));
        //.toList();
        //log(clist.length.toString());
        return mealList;
      }
    } catch (e) {
      log("Error: $e");
    }
    return [];
  }
}
