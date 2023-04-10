import 'package:flutter/material.dart';

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
      appBar: NavigationAppBar(title: "Meal Plan"),
      drawer: NavigationMenu(),
      body: Center(
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: roundedRectShape,
                backgroundColor: Colors.red,
                textStyle: buttonTextStyle),
            icon: const Icon(Icons.person),
            label: const Text('View All Meals'),
            onPressed: () {
              // requestNurseAlertDialog(context);
            }),
      ),
    );

    //   Column(children: [
    //     Row(children: [
    //       IconButton(
    //         icon: const Icon(Icons.refresh),
    //         onPressed: () async {
    //           // await MealPlanPage._myController.getAllMeals();
    //           // _refreshMeals();
    //         },
    //       ),
    //       // _MealPlanTable(MealPlanPage._myController, _refreshMeals)
    //     ])
    //   ]);
    // }
  }

// class _MealPlanTable extends StatelessWidget {
//   final MealPlanController _myController;
//   final VoidCallback _refreshMeals;
//   const _MealPlanTable(this._myController, this._refreshMeals);

//   _createMealColumns() {
//     return [
//       const DataColumn(label: Text('ID')),
//       const DataColumn(label: Text('Type')),
//       const DataColumn(label: Text('Combo'))
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
}
