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
                        child: Column(
                          children: [Text('Day'), Text('1')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('2')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('3')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('4')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('5')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('6')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('7')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('8')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('9')],
                        ),
                      ),
                      Container(
                        height: deviceSize.height * 0.2,
                        width: deviceSize.width * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [Text('Day'), Text('10')],
                        ),
                      ),
                    ]),
              )
            ]))
            //The bottom Navigation should be here
            );
            bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icons8-adjust-50.png')),
              label: 'Control',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/icons8-home-page-50.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/icons/icons8-sales-performance-50.png')),
              label: 'Manage',
            ),
          ],
          currentIndex: 1,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ControlScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageScreen()),
              );
           }}),
  }
}
