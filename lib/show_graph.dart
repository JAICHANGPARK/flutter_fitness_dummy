import 'package:flutter/material.dart';


class ShowGraph extends StatefulWidget {
  @override
  _ShowGraphState createState() => _ShowGraphState();
}

class _ShowGraphState extends State<ShowGraph> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Container(
            color: Colors.grey,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
