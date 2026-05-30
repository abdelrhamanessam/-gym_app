import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_colors.dart';

class InteractiveChart extends StatefulWidget {
  final String title;
  final List<FlSpot> spots;
  final Color lineColor;
  final Color gradientColor;
  final String unit;
  final bool showAverage;

  const InteractiveChart({
    super.key,
    required this.title,
    required this.spots,
    this.lineColor = AppColors.primary,
    this.gradientColor = AppColors.primary,
    this.unit = '',
    this.showAverage = true,
  });

  @override
  State<InteractiveChart> createState() => _InteractiveChartState();
}

class _InteractiveChartState extends State<InteractiveChart> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.spots.isEmpty || (widget.spots.length == 1 && widget.spots.first.y == 0)) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'No data available',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final double maxY = widget.spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    final double minY = widget.spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final double avg = widget.spots.fold(0.0, (sum, s) => sum + s.y) / widget.spots.length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                if (_selectedIndex != null && _selectedIndex! < widget.spots.length)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.lineColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${widget.spots[_selectedIndex!].y.toStringAsFixed(1)} ${widget.unit}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: widget.lineColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (widget.showAverage)
              Text(
                'Avg: ${avg.toStringAsFixed(1)} ${widget.unit}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textHint,
                  fontFamily: 'Poppins',
                ),
              ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: ((maxY - minY) / 4).clamp(1, double.infinity),
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppColors.divider,
                        strokeWidth: 0.5,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minY: (minY - (maxY - minY) * 0.1).clamp(0, double.infinity),
                  maxY: maxY + (maxY - minY) * 0.1,
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.spots,
                      isCurved: true,
                      color: widget.lineColor,
                      barWidth: 2.5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          if (_selectedIndex == index) {
                            return FlDotCirclePainter(
                              radius: 5,
                              color: widget.lineColor,
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: 2,
                            color: widget.lineColor.withOpacity(0.5),
                            strokeWidth: 0,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            widget.gradientColor.withOpacity(0.2),
                            widget.gradientColor.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (spots) {
                        return spots.map((s) {
                          return LineTooltipItem(
                            '${s.y.toStringAsFixed(1)} ${widget.unit}',
                            TextStyle(
                              color: widget.lineColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          );
                        }).toList();
                      },
                    ),
                    touchCallback: (event, response) {
                      if (response?.lineBarSpots != null && response!.lineBarSpots!.isNotEmpty) {
                        setState(() {
                          _selectedIndex = response.lineBarSpots!.first.spotIndex;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
