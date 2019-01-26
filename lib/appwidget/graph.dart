import 'package:flutter/material.dart';
import 'package:flutter_fitness_dummy/themes/colors.dart';
import 'package:flutter_fitness_dummy/utils/fitness_data.dart';

class Graph extends StatelessWidget {
  final double height;
  final AnimationController animationController;
  final List<GraphData> values;

  Graph({this.animationController, this.height = 120, this.values});

  @override
  Widget build(BuildContext context) {
//    print(maxGraphData.value);

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 32.0),
//      child: GraphBar(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildBars(values),
//        children: <Widget>[
//          GraphBar(height, 0.5),
//          GraphBar(height, 0.8),
//          GraphBar(height, 0.7),
//          GraphBar(height, 0.9),
//          GraphBar(height, 0.1),
//        ],
      ),
    );
  }

  _buildBars(List<GraphData> values) {
    List<GraphBar> _bars = List();
    GraphData maxGraphData = values.reduce(
        (current, next) => (next.compareTo(current) >= 1) ? next : current);

    values.forEach((graphData) {
      double percentage = graphData.value / maxGraphData.value;
      _bars.add(GraphBar(height, percentage, animationController));
    });

    return _bars;
  }
}

class GraphBar extends StatefulWidget {
  final double percentage;
  final double height;
  final AnimationController _graphBarAnimationController;

  GraphBar(this.height, this.percentage, this._graphBarAnimationController);

  @override
  _GraphBarState createState() => _GraphBarState();
}

class _GraphBarState extends State<GraphBar> {
  Animation<double> _percentageAnimation;

  @override
  void initState() {
    super.initState();

    _percentageAnimation = Tween<double>(begin: 0, end: widget.percentage)
        .animate(widget._graphBarAnimationController);

    _percentageAnimation.addListener((){
      setState(() {

      });
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget._graphBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
//      painter: BarPainter(widget.percentage),
      painter: BarPainter(_percentageAnimation.value),
      child: Container(
        height: widget.height,
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  final double percentage;

  BarPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint greyPaint = Paint()
      ..color = greyColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    Offset topPoint = Offset(0, 0);
    Offset bottomPoint = Offset(0, (size.height + 20));
    Offset centerPoint = Offset(0, (size.height + 20) / 2);
    canvas.drawLine(topPoint, bottomPoint, greyPaint);

    Paint filledPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.pink.shade500, Colors.blue.shade500],
        begin: Alignment.topCenter,
      ).createShader(Rect.fromPoints(topPoint, bottomPoint))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    double filledHeight = percentage * size.height;
    double filledHalfHeight = filledHeight / 2;

    canvas.drawLine(
        centerPoint, Offset(0, centerPoint.dy - filledHalfHeight), filledPaint);
    canvas.drawLine(
        centerPoint, Offset(0, centerPoint.dy + filledHalfHeight), filledPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
