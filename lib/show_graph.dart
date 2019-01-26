import 'package:flutter/material.dart';

class ShowGraph extends StatefulWidget {
  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph>
    with SingleTickerProviderStateMixin<ShowGraph> {
  AnimationController _graphAnimationController;

  @override
  void initState() {
    _graphAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _graphAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            color: Colors.grey,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
