import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ExpenseGraph extends StatefulWidget {
  const ExpenseGraph({Key key}) : super(key: key);

  @override
  _ExpenseGraphState createState() => _ExpenseGraphState();
}

class _ExpenseGraphState extends State<ExpenseGraph> {

  List<charts.Series> seriesList;

  static List<charts.Series<DataItem, String>> _createData(){

    final incomeData=[
      DataItem('Jan', 45),
      DataItem('Feb', 38),
      DataItem('Mar', 31),
      DataItem('Apr', 20),
      DataItem('May', 45),
      DataItem('Jun', 11),
      DataItem('Jul', 33),
      DataItem('Aug', 21),
      DataItem('Sep', 20),
      DataItem('Oct', 28),
      DataItem('Nov', 34),
      DataItem('Dec', 19),
    ];

    final expenseData=[
      DataItem('Jan', 40),
      DataItem('Feb', 32),
      DataItem('Mar', 25),
      DataItem('Apr', 23),
      DataItem('May', 34),
      DataItem('Jun', 16),
      DataItem('Jul', 30),
      DataItem('Aug', 15),
      DataItem('Sep', 24),
      DataItem('Oct', 20),
      DataItem('Nov', 28),
      DataItem('Dec', 23),
    ];

    return [
      charts.Series<DataItem, String>(
        id: 'Charts',
        domainFn: (DataItem dataItem, _)=> dataItem.month,
        measureFn: (DataItem dataItem, _)=> dataItem.amount,
        data: incomeData,
        seriesColor: charts.MaterialPalette.green.shadeDefault,
        displayName: 'Income',
    ),
    charts.Series<DataItem, String>(
      id: 'Charts',
      domainFn: (DataItem dataItem, _)=> dataItem.month,
      measureFn: (DataItem dataItem, _)=> dataItem.amount,
      data: expenseData,
      seriesColor: charts.MaterialPalette.red.shadeDefault,
      displayName: 'Expenses',

    ),
    ];

  }

  barChart(){
    return charts.BarChart(
      seriesList,
      animate: false,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        cornerStrategy: charts.ConstCornerStrategy(20),
        ),
      behaviors: [charts.SeriesLegend()],

      );
  }

  @override
  void initState() {
    super.initState();

    seriesList=_createData();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 250,
        width: 700,
        child: barChart(),
      ),
    );
  }
}


class DataItem{
  final String month;
  final int amount;
  DataItem(this.month, this.amount);
}
