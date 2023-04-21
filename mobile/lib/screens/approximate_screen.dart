import 'package:flutter/material.dart';

class BodyType {
  final String name;
  final String image;
  final String description;
  final int minWeight;
  final int maxWeight;

  BodyType(
      {required this.name,
      required this.image,
      required this.description,
      required this.minWeight,
      required this.maxWeight});
}

final List<BodyType> bodyTypes = [
  BodyType(
      name: "Thin",
      image:
          "https://images.pexels.com/photos/3651340/pexels-photo-3651340.jpeg",
      description: "BMI < 18.5",
      minWeight: 30,
      maxWeight: 55),
  BodyType(
      name: "Normal",
      image:
          "https://images.pexels.com/photos/5933827/pexels-photo-5933827.jpeg",
      description: "BMI 18.5 - 24.9",
      minWeight: 55,
      maxWeight: 90),
  BodyType(
      name: "Overweight",
      image:
          "https://images.pexels.com/photos/3109837/pexels-photo-3109837.jpeg",
      description: "BMI 25 - 29.9",
      minWeight: 90,
      maxWeight: 135),
  BodyType(
      name: "Obese Class I",
      image:
          "https://images.pexels.com/photos/4497558/pexels-photo-4497558.jpeg",
      description: "BMI 30 - 34.9",
      minWeight: 135,
      maxWeight: 180),
  BodyType(
      name: "Obese Class II",
      image:
          "https://images.pexels.com/photos/3908070/pexels-photo-3908070.jpeg",
      description: "BMI 35 - 39.9",
      minWeight: 180,
      maxWeight: 225),
  BodyType(
      name: "Obese Class III",
      image:
          "https://images.pexels.com/photos/7074127/pexels-photo-7074127.jpeg",
      description: "BMI > 40",
      minWeight: 225,
      maxWeight: 300),
];

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  late int _age;
  late double _height;
  late double _weight;
  late String _bodyType;

  void _calculateBMI() {
    double heightInMeters = _height / 100.0;
    double bmi = _weight / (heightInMeters * heightInMeters);

    for (var bodyType in bodyTypes) {
      if (bmi >= bodyType.minWeight && bmi <= bodyType.maxWeight) {
        setState(() {
          _bodyType = bodyType.name;
        });
        return;
      }
    }

    setState(() {
      _bodyType = "Unknown";
    });
  }

  @override
  void initState() {
    super.initState();
    _age = 20;
    _height = 170.0;
    _weight = 60.0;
    _bodyType = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: SingleChildScrollView(padding));
  }
}
