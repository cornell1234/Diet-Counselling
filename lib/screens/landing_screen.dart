import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: [
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/healthy_food_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Diet')
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
