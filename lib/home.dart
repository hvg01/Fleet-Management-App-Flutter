import 'package:fleet_management_app/analysis/analysis.dart';
import 'package:fleet_management_app/dashboard/dashboard.dart';
import 'package:fleet_management_app/expenses/expenses.dart';
import 'package:fleet_management_app/track/track.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;
  List mainScreens= <Widget> [Dashboard(),Track(),Analysis(), Expenses()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.dashboard_outlined,
          Icons.location_on_outlined,
          Icons.show_chart_outlined,
          Icons.account_balance_wallet_outlined,
        ],
        labelList: ['Dashboard', 'Track', 'Analysis', 'Expenses'],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      body:  mainScreens[_selectedItem],
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> labelList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        @required this.iconList,
        @required this.onChange,
        @required this.labelList});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List <String> _labelList=[];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _labelList= widget.labelList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i, _labelList[i]));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
            border: Border(
              top: BorderSide(width: 4, color: Colors.black),
            ),
            gradient: LinearGradient(colors: [
              Colors.grey.withOpacity(0.3),
              Colors.grey.withOpacity(0.015),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        )
            : BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey[300]),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Icon(
                icon,
                size: index == _selectedIndex ? 22 : 20 ,
                color: index == _selectedIndex ? Colors.black : Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(label,
                style: TextStyle(
                  color: index == _selectedIndex ? Colors.black : Colors.grey,
                  fontSize: index == _selectedIndex ? 13.5 : 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}