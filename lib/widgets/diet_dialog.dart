import 'package:diet_counselling/utils/get_meals.dart';
import 'package:flutter/material.dart';

// BREAKFAST
class BreakfastDialog extends StatefulWidget {
  const BreakfastDialog({super.key});

  @override
  BreakfastDialogState createState() => BreakfastDialogState();
}

class BreakfastDialogState extends State<BreakfastDialog> {
  String breakfastData = '';

  @override
  void initState() {
    super.initState();
    // Call the getMeal function here and assign the result to breakfastData
    breakfastData = getMeal('2', 'Breakfast', '18');
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Breakfast'),
        content: Text(breakfastData));
  }
}
//BREAKFAST

// FIRST SNACK
class FirstsnackDialog extends StatefulWidget {
  const FirstsnackDialog({super.key});

  @override
  FirstsnackDialogState createState() => FirstsnackDialogState();
}

class FirstsnackDialogState extends State<FirstsnackDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('First Snack'),
        content: Text('data'));
  }
}
// FIRST SNACK

// LUNCH
class LunchDialog extends StatefulWidget {
  const LunchDialog({super.key});

  @override
  LunchDialogState createState() => LunchDialogState();
}

class LunchDialogState extends State<LunchDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Lunch'),
        content: Text('data'));
  }
}
// LUNCH

// SECOND SNACK
class SecondsnackDialog extends StatefulWidget {
  const SecondsnackDialog({super.key});

  @override
  SecondsnackDialogState createState() => SecondsnackDialogState();
}

class SecondsnackDialogState extends State<SecondsnackDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Second Snack'),
        content: Text('data'));
  }
}
// SECOND SNACK

// DINNER
class DinnerDialog extends StatefulWidget {
  const DinnerDialog({super.key});

  @override
  DinnerDialogState createState() => DinnerDialogState();
}

class DinnerDialogState extends State<DinnerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Dinner'),
        content: Text('data'));
  }
}
//DINNER

// EXTRA
class ExtraDialog extends StatefulWidget {
  const ExtraDialog({super.key});

  @override
  ExtraDialogState createState() => ExtraDialogState();
}

class ExtraDialogState extends State<ExtraDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Extra'),
        content: Text('data'));
  }
}
// EXTRA