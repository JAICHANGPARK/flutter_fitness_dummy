import 'package:flutter/material.dart';
import 'package:flutter_fitness_dummy/appwidget/top_bar.dart';
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

class MyHomePage extends StatelessWidget {
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
                      onPressed: () {},
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Monday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              letterSpacing: 1.5),
                        ),
                        Text(
                          "JAN 25 2019",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              letterSpacing: 1.2,
                              wordSpacing: 1.3),
                        )
                      ],
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
