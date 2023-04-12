import 'package:flutter/material.dart';
import 'package:project_1/mealplan/meal.dart';

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
      body: Column(children: [
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
            }),
        _MealPlanTable(MealPlanPage._myController, _refreshMeals),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: roundedRectShape,
                backgroundColor: Colors.yellow,
                textStyle: buttonTextStyle),
            icon: const Icon(Icons.free_breakfast),
            label: const Text('View All Breakfast'),
            onPressed: () async {
              _refreshMeals();
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
      ]
          //

          ),
    );
  }
}

class _MealPlanTable extends StatelessWidget {
  final MealPlanController _myController;
  final VoidCallback _refreshMeals;
  const _MealPlanTable(this._myController, this._refreshMeals);

  _createMealRows(List<Meal> mealList, BuildContext context) {
    return mealList
        .map((meal) => DataRow(cells: [
              DataCell(Text('#${meal.id}')),
              DataCell(Text(meal.type)),
              DataCell(Text(meal.combo)),
              DataCell(
                ButtonBar(
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center)
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // _showaddresses(context, customer);
                        _refreshMeals();
                      },
                      child: const Text('Create Order'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // _showDetails(context, meal);
                      },
                      child: const Text('Show Details'),
                    ),
                  ],
                ),
              ),
            ]))
        .toList();
  }

  _createMealColumns() {
    return [
      const DataColumn(label: Text('ID')),
      const DataColumn(label: Text('Type')),
      const DataColumn(label: Text('Combo')),
      const DataColumn(label: Text('Actions'))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Meal>>(
        future: _myController.getAllMeals(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading..'));
          } 
          else {
            return Scrollbar(
                child: DataTable(
                    columns: _createMealColumns(),
                    rows: _createMealRows(snapshot.data ?? [], context)));
          }
        });
  }
}
