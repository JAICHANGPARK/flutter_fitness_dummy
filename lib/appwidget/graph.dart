import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  final double height;
  final AnimationController animationController;

  Graph({this.animationController, this.height = 120});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
child: GraphBar(),
//      child: Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          GraphBar(),
//          GraphBar(),
//          GraphBar(),
//          GraphBar(),
//          GraphBar(),
//
//        ],
//      ),
    );
  }


}

class GraphBar extends StatefulWidget {
  @override
  _GraphBarState createState() => _GraphBarState();
}

class _GraphBarState extends State<GraphBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      color: Colors.blue,
    );
  }
}

