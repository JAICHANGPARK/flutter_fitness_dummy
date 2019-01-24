import 'package:flutter/material.dart';
import 'package:flutter_fitness_dummy/appwidget/top_bar.dart';
import 'package:flutter_fitness_dummy/date_utils.dart';
import 'package:flutter_fitness_dummy/themes/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: appTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _subtractDate() {
    selectedDate = selectedDate.subtract(Duration(days: 1));
  }

  void _addDate() {
    selectedDate = selectedDate.add(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(),
              Positioned(
                top: 60.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
//                        setState(() {});
                        setState(() {
                          _subtractDate();
                        });
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            formatterDayOfWeek.format(selectedDate),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                color: Colors.white,
                                letterSpacing: 1.2),
                          ),
                          Text(
                            formatterDate.format(selectedDate),
                            style: TextStyle(
//                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 135.0,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onPressed: () {
//                            setState(() {});
                            setState(() {
                              _addDate();
                            });
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
