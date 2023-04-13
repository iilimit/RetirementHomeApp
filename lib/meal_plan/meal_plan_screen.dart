import 'package:flutter/material.dart';
import 'package:project_1/meal_plan/view_all_meals_page.dart';
import 'package:project_1/meal_plan/view_breakfast_page.dart';

import '../navigation/navigationbar_widget.dart';
import 'meal_plan_controller.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key, required this.mytitle});
  final String mytitle;
  static final MealPlanController _myController = MealPlanController();
  @override
  // ignore: library_private_types_in_public_api
  _MealPlanPage createState() => _MealPlanPage();
}

class _MealPlanPage extends State<MealPlanPage> {
  void _refreshMeals() {
    setState(() {});
  }

  final roundedRectShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0));
  @override
  Widget build(BuildContext context) {
    var buttonTextStyle = const TextStyle(fontSize: 20);

    return Scaffold(
      appBar: const NavigationAppBar(title: "Meal Plan"),
      drawer: const NavigationMenu(),
      body: Align(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: roundedRectShape,
                    backgroundColor: Colors.red,
                    textStyle: buttonTextStyle),
                icon: const Icon(Icons.local_dining),
                label: const Text('View All Meals'),
                onPressed: () async {
                  await MealPlanPage._myController.getAllMeals();
                  _refreshMeals();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MealPlanAllMealsPage(mytitle: 'All Meals')),
                  );
                }),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: roundedRectShape,
                    backgroundColor: Colors.yellow,
                    textStyle: buttonTextStyle),
                icon: const Icon(Icons.free_breakfast),
                label: const Text('View All Breakfast'),
                onPressed: () async {
                  await MealPlanPage._myController.getAllBreakfast();
                  _refreshMeals();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MealPlanBreakfastPage(
                            mytitle: 'All Breakfast')),
                  );
                }),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: roundedRectShape,
                    backgroundColor: Colors.green,
                    textStyle: buttonTextStyle),
                icon: const Icon(Icons.lunch_dining),
                label: const Text('View All Lunches'),
                onPressed: () async {
                  _refreshMeals();
                }),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: roundedRectShape,
                    backgroundColor: Colors.blue,
                    textStyle: buttonTextStyle),
                icon: const Icon(Icons.dinner_dining),
                label: const Text('View All Dinners'),
                onPressed: () async {
                  _refreshMeals();
                })
          ])),
    );
  }
}
