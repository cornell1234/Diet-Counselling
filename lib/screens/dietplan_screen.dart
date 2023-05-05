// ignore_for_file: prefer_const_constructors

import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class dietplanScreen extends StatefulWidget {
  const dietplanScreen({Key? key}) : super(key: key);

  @override
  dietplanScreenState createState() => dietplanScreenState();
}

class dietplanScreenState extends State<dietplanScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 3.2;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Diet plan',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage('assets/icons/notification_50px.png'),
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                  );
                },
                icon: const ImageIcon(
                  AssetImage('assets/icons/home_50px.png'),
                  color: Colors.black,
                )),
          ]),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: GridView.count(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  crossAxisCount: 5,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: [
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(children: [
                        Text('Day'),
                        Text('1'),
                        Text(
                            'Breakfast: 2 Scrambled eggs, bread with avocado, and apple'),
                        Text('Snack: 1 apple, 1/4 cup of groundnuts'),
                        Text(
                            'Lunch: 2 lamps small size nsima, 2 pieces of chicken, 2 slices of tomato,1 slice of cheese, 2 carrots'),
                        Text(
                            'snack: 1 cup of plain yogurt, half cup of strawberries'),
                        Text(
                            'Dinner: 2 medium size sweet potato, vegetables(broccoli, carrots and peppers,), 1 banana'),
                        Text('small bowl of slices peaches')
                      ]),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          Text('Day'),
                          Text('2'),
                          Text(
                              'Breakfast: Oatmeal/pumpkin, banana, toasted bread'),
                          Text('Snack: 1 apple, peanut butter 2 spoons'),
                          Text(
                              'Lunch: 2 lamps small size nsima/spaghetti, fish, 2 slices of tomato, black beans'),
                          Text('snack: 2 medium pineapple slices'),
                          Text(
                              'Dinner: brown rice, vegetables(broccoli, carrots and peppers,), beef stir-fry'),
                          Text('small bowl plums/mangoes')
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
                          Text('Day'),
                          Text('3'),
                          Text(
                              'Breakfast: Oatmeal/ sweetpotatoes, yogurt with honey, berries /apples/ oranges'),
                          Text('Snack: boiled egg'),
                          Text(
                              'Lunch: 2 slices of bread, 2 slices of tomato, 1 avocado'),
                          Text('snack: 2 banana and 1 spoon peanut butter'),
                          Text(
                              'Dinner: roasted chicken, sweet potato and green beans'),
                          Text('small bowl sliced oranges/mangoes')
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
                          Text('Day'),
                          Text('4'),
                          Text(
                              'Breakfast: pumpkins/waffles, peanut butter and banana'),
                          Text('Snack: boiled egg/ carrots'),
                          Text('Lunch: potato salad, medium size salad'),
                          Text(
                              'snack: plain yogurt/ oranges/ mangoes/ carrots'),
                          Text(
                              'Dinner: roasted chicken, brown rice and green beans'),
                          Text('small bowl sliced peaches/mangoes')
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
                          Text('Day'),
                          Text('5'),
                          Text(
                              'Breakfast: scrambled eggs with salad and 1 slice of bread'),
                          Text('Snack: apple slices'),
                          Text('Lunch: Grilled chicken add vinegar, 1 avocado'),
                          Text('snack: 2 bananas'),
                          Text(
                              'Dinner: beef meatballs, pasta/nsima and green beans'),
                          Text('small bowl oranges/plums')
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
                          Text('Day'),
                          Text('6'),
                          Text(
                              'Breakfast: avocado/banana smoothie, peanut butter, milk  sweetpotatoes'),
                          Text('Snack: boiled egg/handfull groundnuts'),
                          Text('Lunch: 1 corn, salad, roasted chicken'),
                          Text('snack: plain yogurt, carrots'),
                          Text(
                              'Dinner: roasted chicken, sweet potato and vegetables'),
                          Text('small bowl of sliced mangoes')
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
                          Text('Day'),
                          Text('7'),
                          Text(
                              'Breakfast: Avocado, sliced tomatoes, apples/ oranges'),
                          Text('Snack: Carrots'),
                          Text(
                              'Lunch: Roasted chicken, sweet potatoes and vegetables'),
                          Text('snack: cheese, 1 spoon peanut butter'),
                          Text('Dinner: fish, sweet potato and green beans'),
                          Text('small bowl oranges/mangoes')
                        ],
                      ),
                    ),
                  ]),
            )
          ])),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/healthy_food_50px.png')),
              label: 'Diet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/math_50px.png'),
              ),
              label: 'BMI',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage('assets/icons/health_checkup_50px.png')),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/intelligence_50px.png')),
              label: 'AI Assistant',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/graph_report_50px.png')),
              label: 'Report',
            ),
          ],
          currentIndex: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            }
          }),
    );
  }
}
