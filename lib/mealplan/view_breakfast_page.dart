import 'package:flutter/material.dart';
import 'package:project_1/mealplan/meal.dart';

import '../navigation/navigationbar_widget.dart';
import 'meal_plan_controller.dart';

class MealPlanBreakfastPage extends StatefulWidget {
  const MealPlanBreakfastPage({super.key, required this.mytitle});
  final String mytitle;
  static final MealPlanController _myController = MealPlanController();
  @override
  // ignore: library_private_types_in_public_api
  _MealPlanBreakfastPage createState() => _MealPlanBreakfastPage();
}

class _MealPlanBreakfastPage extends State<MealPlanBreakfastPage> {
  void _refreshMeals() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const NavigationAppBar(title: "Meal Plan"),
      drawer: const NavigationMenu(),
      body: 
      Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          child: IconButton(icon: const Icon(Icons.refresh), onPressed: () async { await MealPlanBreakfastPage._myController.getAllBreakfast();
                    _refreshMeals(); },)
        ),
        _MealPlanTable(MealPlanBreakfastPage._myController, _refreshMeals),
      ]),
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
        future: _myController.getAllBreakfast(),
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
