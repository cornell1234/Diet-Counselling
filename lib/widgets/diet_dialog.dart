import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/models/diet_plan.dart';
import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/provider/dietplan_provider.dart';
import 'package:diet_counselling/utils/get_meals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// BREAKFAST
// class BreakfastDialog extends StatefulWidget {
//   const BreakfastDialog({super.key});

//   @override
//   BreakfastDialogState createState() => BreakfastDialogState();
// }

// class BreakfastDialogState extends State<BreakfastDialog> {
//   String mealData = '';

//   @override
//   void initState() {
//     super.initState();
//     // Call the getMeal function here and assign the result to mealData
//     mealData = getMeal('2', 'Breakfast', '18');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//         title: const Text('Breakfast'),
//         content: Text(mealData));
//   }
// }

class BreakfastDialog extends StatefulWidget {
  const BreakfastDialog({Key? key}) : super(key: key);

  @override
  _BreakfastDialogState createState() => _BreakfastDialogState();
}

class _BreakfastDialogState extends State<BreakfastDialog> {
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Breakfast'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData = getMeal(
                numberOfDays.toString(), 'Breakfast', bmivalue.toString());
            return Text(mealData);
          });
        }));
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
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('First Snack'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData = getMeal(
                numberOfDays.toString(), 'FirstSnack', bmivalue.toString());
            return Text(mealData);
          });
        }));
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
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Lunch'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData =
                getMeal(numberOfDays.toString(), 'Lunch', bmivalue.toString());
            return Text(mealData);
          });
        }));
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
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Second Snack'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData = getMeal(
                numberOfDays.toString(), 'SecondSnack', bmivalue.toString());
            return Text(mealData);
          });
        }));
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
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Dinner'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData =
                getMeal(numberOfDays.toString(), 'Dinner', bmivalue.toString());
            return Text(mealData);
          });
        }));
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
  String mealData = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getLatestBMIByEmail();
      Provider.of<DietPlanProvider>(context, listen: false)
          .getDietPlanByEmail();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('Extra'),
        content: Consumer<DietPlanProvider>(builder: (context, dietPlan, _) {
          var diet = dietPlan.dietPlan;
          DateTime startDate = diet?.startDate ?? DateTime.now();
          DateTime now = DateTime.now();

          DateTime startDateWithoutTime =
              DateTime(startDate.year, startDate.month, startDate.day);
          DateTime nowWithoutTime = DateTime(now.year, now.month, now.day);

          Duration difference = nowWithoutTime.difference(startDateWithoutTime);
          int numberOfDays = difference.inDays;

          print(numberOfDays);
          if (diet == null) {}
          return Consumer<BMIProvider>(builder: (context, bmi, _) {
            var BMI = bmi.bmi;
            print(BMI!.bmi);
            var bmivalue;
            if (BMI.bmi >= 18 && BMI.bmi <= 24) {
              bmivalue = 18;
            }
            if (BMI.bmi >= 25 && BMI.bmi <= 29) {
              bmivalue = 25;
            }
            if (BMI.bmi >= 30 && BMI.bmi <= 39) {
              bmivalue = 30;
            }
            if (BMI.bmi >= 40) {
              bmivalue = 40;
            }
            print(bmivalue);
            mealData =
                getMeal(numberOfDays.toString(), 'Extra', bmivalue.toString());
            return Text(mealData);
          });
        }));
  }
}
// EXTRA