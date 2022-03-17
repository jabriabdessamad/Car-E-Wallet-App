import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    final LinearGradient _linearGradient = LinearGradient(
        colors: <Color>[
          Colors.purpleAccent[700]!,
          Colors.purpleAccent[100]!,
          Colors.purple[600]!,
          Colors.deepPurpleAccent[400]!,
          Colors.purple[900]!,
        ],
        stops: <double>[
          0.1,
          0.3,
          0.5,
          0.7,
          0.9
        ],
        // Setting gradient rotation value(degrees in radian) to transform the series gradient
        transform: GradientRotation(
            (135 * (3.14 / 180)) // Converted 135 degree to radian
            ));

    final List<ChartData> chartData = [
      ChartData('jan', 25),
      ChartData('fab', 43),
      ChartData('mar', 25),
      ChartData('apr', 155),
      ChartData('may', 27),
      ChartData('jun', 70)
    ];
    return Scaffold(
        body: SfCartesianChart(
            plotAreaBorderColor: Colors.transparent,
            primaryXAxis: CategoryAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              majorGridLines: MajorGridLines(width: 0),
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0)),
            series: <ChartSeries>[
          // Renders spline chart
          SplineSeries<ChartData, String>(
              dataSource: chartData,
              color: Color(0xff38267E),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
