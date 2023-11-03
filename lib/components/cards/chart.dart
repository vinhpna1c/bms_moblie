import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  late List<ActivityData> _chartData; // = getActivityData();
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _chartData = getActivityData();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: <ChartSeries>[
        ColumnSeries<ActivityData, String>(
            name: 'Employee',
            dataSource: _chartData,
            xValueMapper: (ActivityData acData, _) => acData.datetime,
            yValueMapper: (ActivityData acData, _) => acData.value,
            color: Color.fromRGBO(5, 91, 162, 1)),
        ColumnSeries<ActivityData, String>(
            name: 'Unknown',
            dataSource: _chartData,
            xValueMapper: (ActivityData acData, _) => acData.datetime,
            yValueMapper: (ActivityData acData, _) => acData.value2,
            color: Color.fromRGBO(0, 155, 113, 1)),
      ],
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: _tooltip,
      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
    );
  }

  List<ActivityData> getActivityData() {
    final List<ActivityData> chartData = [
      ActivityData("01/11", 10, 23),
      ActivityData("02/11", 30, 5),
      ActivityData("03/11", 45, 32),
      ActivityData("04/11", 34, 18),
      ActivityData("05/11", 12, 38),
      ActivityData("06/11", 20, 10),
    ];
    return chartData;
  }
}

class ActivityData {
  ActivityData(this.datetime, this.value, this.value2);
  final String datetime;
  final double value;
  final double? value2;
}
