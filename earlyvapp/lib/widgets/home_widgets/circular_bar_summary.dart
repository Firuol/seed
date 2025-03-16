import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularBarSummary extends StatefulWidget {
  final int healthyCount;
  final int atRiskCount;
  final int criticalCount;

  CircularBarSummary({
    required this.healthyCount,
    required this.atRiskCount,
    required this.criticalCount,
  });

  @override
  _CircularBarSummaryState createState() => _CircularBarSummaryState();
}

class _CircularBarSummaryState extends State<CircularBarSummary> {
  late int total;
  late double healthyPercent;
  late double atRiskPercent;
  late double criticalPercent;

  late String displayLabel;
  late int displayCount;
  late Color displayColor;
  late double displayPercent;

  @override
  void initState() {
    super.initState();
    total = widget.healthyCount + widget.atRiskCount + widget.criticalCount;
    healthyPercent = widget.healthyCount / total;
    atRiskPercent = widget.atRiskCount / total;
    criticalPercent = widget.criticalCount / total;

    displayLabel = 'Horii fayyaa';
    displayCount = widget.healthyCount;
    displayColor = Color(0xFF4DE342);
    displayPercent = healthyPercent;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 10.0,
              percent: displayLabel == 'Fayyalessa' ? displayPercent : 0.0,
              progressColor: displayLabel == 'Fayyalessa'
                  ? displayColor
                  : Colors.transparent,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 10.0,
              percent: displayLabel == 'Dhukkubsata' ? displayPercent : 0.0,
              progressColor: displayLabel == 'Dhukkubsata'
                  ? displayColor
                  : Colors.transparent,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            CircularPercentIndicator(
              radius: 70.0,
              lineWidth: 10.0,
              percent: displayLabel == 'B/Dhukkubsata' ? displayPercent : 0.0,
              progressColor: displayLabel == 'B/Dhukkubsata'
                  ? displayColor
                  : Colors.transparent,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$displayCount',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: displayColor)),
                Text(displayLabel, style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegend(Color(0xFF4DE342), 'Fayyalessa', widget.healthyCount,
                'Fayyalessa', Color(0xFF4DE342), healthyPercent),
            _buildLegend(Color(0xFFFF813D), 'Dhukkubsata', widget.atRiskCount,
                'Dhukkubsata', Color(0xFFFF813D), atRiskPercent),
            _buildLegend(
                Color(0xFFF20000),
                'B/Dhukkubsata',
                widget.criticalCount,
                'B/Dhukkubsata',
                Color(0xFFF20000),
                criticalPercent),
          ],
        ),
      ],
    );
  }

  Widget _buildLegend(Color color, String label, int count, String labelText,
      Color progressColor, double percent) {
    return GestureDetector(
      onTap: () {
        setState(() {
          displayLabel = label;
          displayCount = count;
          displayColor = progressColor;
          displayPercent = percent;

          if (labelText == 'Healthy') {
            healthyPercent = count / total;
          } else if (labelText == 'At Risk') {
            atRiskPercent = count / total;
          } else {
            criticalPercent = count / total;
          }
        });
      },
      child: Row(
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8),
          Text('$label ($count)'),
        ],
      ),
    );
  }
}
