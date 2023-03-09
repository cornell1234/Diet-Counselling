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
                    ]),
              )
            ])));
  }
}
