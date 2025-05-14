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

    displayLabel = 'Healthy';
    displayCount = widget.healthyCount;
    displayColor = Color(0xFF4DE342);
    displayPercent = healthyPercent;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(15), // Curved edges
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow effect
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularPercentIndicator(
                  radius: screenWidth * 0.18,
                  lineWidth: screenWidth * 0.025,
                  percent: displayLabel == 'Healthy' ? displayPercent : 0.0,
                  progressColor: displayLabel == 'Healthy'
                      ? displayColor
                      : Colors.transparent,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                CircularPercentIndicator(
                  radius: screenWidth * 0.18,
                  lineWidth: screenWidth * 0.025,
                  percent: displayLabel == 'At Risk' ? displayPercent : 0.0,
                  progressColor: displayLabel == 'At Risk'
                      ? displayColor
                      : Colors.transparent,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                CircularPercentIndicator(
                  radius: screenWidth * 0.18,
                  lineWidth: screenWidth * 0.025,
                  percent: displayLabel == 'Critical' ? displayPercent : 0.0,
                  progressColor: displayLabel == 'Critical'
                      ? displayColor
                      : Colors.transparent,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$displayCount',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: displayColor,
                      ),
                    ),
                    Text(
                      displayLabel,
                      style: TextStyle(fontSize: screenWidth * 0.03),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLegend(
                    Color(0xFF4DE342),
                    'Healthy',
                    widget.healthyCount,
                    'Healthy',
                    Color(0xFF4DE342),
                    healthyPercent),
                _buildLegend(
                    Color(0xFFFF813D),
                    'At Risk',
                    widget.atRiskCount,
                    'At Risk',
                    Color(0xFFFF813D),
                    atRiskPercent),
                _buildLegend(
                    Color(0xFFF20000),
                    'Critical',
                    widget.criticalCount,
                    'Critical',
                    Color(0xFFF20000),
                    criticalPercent),
              ],
            ),
          ),
        ],
      ),
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
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8),
            Text(
              '$label ($count)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
