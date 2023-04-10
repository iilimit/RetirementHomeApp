import 'package:flutter/material.dart';

import '../navigation/navigationbar_widget.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key, required this.mytitle});
  final String mytitle;
  @override
  // ignore: library_private_types_in_public_api
  _MealPlanPage createState() => _MealPlanPage();
}

class _MealPlanPage extends State<MealPlanPage> {
  void _refreshMeals() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavigationAppBar(title: "Meal Plan"),
      drawer: NavigationMenu(),
      // body: Center(
      //   child: _buildButtonsColumn(context),
      // ),
      // drawer: const CommonMenu(),
    );
  }
}
