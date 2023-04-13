import 'package:flutter/material.dart';
import 'package:project_1/meal_plan/meal.dart';
import 'meal_plan_controller.dart';

class MealDetailScreen extends StatefulWidget
{
  static final MealPlanController _myController = MealPlanController();

  const MealDetailScreen({super.key});
  @override
  _MealDetailScreen createState() => _MealDetailScreen();
}

class _MealDetailScreen extends State<MealDetailScreen> {

  void _refreshPage()
  {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int mealid = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Meal Details", textAlign: TextAlign.center)),
      ),
      body: Center( 
        child: Row(
        children: [
          FutureBuilder<Meal>(
          future: MealDetailScreen._myController.getMealByID(mealid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading customer details..'));
            } else {
            Meal? meal = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Text("Fisrt Name: ${meal?.type??""}"),
                Text("Last Name: ${meal?.combo??""}")
              ],
            );
            }
          })
        ])
      )
    );    

}
}
