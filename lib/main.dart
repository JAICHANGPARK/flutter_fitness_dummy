import 'package:flutter/material.dart';
import 'package:flutter_fitness_dummy/appwidget/monthly_status_listing.dart';
import 'package:flutter_fitness_dummy/appwidget/radial_progress.dart';
import 'package:flutter_fitness_dummy/appwidget/top_bar.dart';
import 'package:flutter_fitness_dummy/blocs/home_page_bloc.dart';
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

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  HomePageBloc homePageBloc;

  AnimationController _iconAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    homePageBloc = HomePageBloc();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    homePageBloc.dispose();
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
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

                            homePageBloc.subtractDate();
                          },
                        ),
                        StreamBuilder(
                            initialData: homePageBloc.selectedDate,
                            stream: homePageBloc.dateSteam,
                            builder: (context, snapshot) {
                              return Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      formatterDayOfWeek.format(snapshot.data),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                          color: Colors.white,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      formatterDate.format(snapshot.data),
                                      style: TextStyle(
//                              fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        letterSpacing: 1.3,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
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

                                homePageBloc.addDate();
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
              RadialProgress(),
              MonthlyStatusListing(),
            ],
          ),
          Positioned(
            bottom: 50.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 4.0)),
              child: IconButton(
                  icon: AnimatedIcon(
                      color: Colors.red,
                      icon: AnimatedIcons.menu_close,
                      progress: _iconAnimationController.view),
                  onPressed: () {
                    setState(() {
                      onIconPressed();
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }

  void onIconPressed() {
    animationStatus
        ? _iconAnimationController.reverse()
        : _iconAnimationController.forward();
  }

  bool get animationStatus {
    final AnimationStatus status = _iconAnimationController.status;
    return status == AnimationStatus.completed;
  }
}
