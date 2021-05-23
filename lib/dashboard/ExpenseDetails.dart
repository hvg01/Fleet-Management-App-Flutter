import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({Key key}) : super(key: key);

  @override
  _ExpenseDetailsState createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  int _selectedItem = 0;
  List expense = [TripExpenses(), NonTripExpenses()];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Expense Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ExpenseTabs(
              onChange: (val) {
                setState(() {
                  _selectedItem = val;
                });
              },
              labelList: ['Trip Expenses', 'Non-Trip Expenses']),
          Container(
            child: expense[_selectedItem],
          ),
        ],
      ),
    );
  }
}

class ExpenseTabs extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> labelList;

  ExpenseTabs(
      {this.defaultSelectedIndex = 0,
      @required this.onChange,
      @required this.labelList});

  @override
  _ExpenseTabsState createState() => _ExpenseTabsState();
}

class _ExpenseTabsState extends State<ExpenseTabs> {
  int _selectedIndex = 0;
  List<String> _labelList = [];

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _labelList = widget.labelList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _expenseTabList = [];

    for (var i = 0; i < _labelList.length; i++) {
      _expenseTabList.add(buildExpenseTabItem(i, _labelList[i]));
    }

    return Row(
      children: _expenseTabList,
    );
  }

  Widget buildExpenseTabItem(int index, String label) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          height: 35,
          decoration: index == _selectedIndex
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 4, color: Colors.black),
                  ),
                )
              : BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              label,
              style: TextStyle(
                color: index == _selectedIndex ? Colors.black : Colors.grey,
                fontSize: index == _selectedIndex ? 17 : 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TripExpenses extends StatefulWidget {
  const TripExpenses({Key key}) : super(key: key);

  @override
  _TripExpensesState createState() => _TripExpensesState();
}

class _TripExpensesState extends State<TripExpenses> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              ExpenseCard(iconData: Icons.local_gas_station, title: 'Fuel Expense', description: "3050 ltr filled", date: '02/07/2020', amount: '12,34,978'),
              ExpenseCard(iconData: Icons.toll, title: 'Toll Charges', description: '123 Tolls', date: '02/07/2020', amount: '12,000'),
              ExpenseCard(iconData: Icons.person, title: 'Driver Commission', description: '108 trips made', date: '02/07/2020', amount: '5,35,657'),

            ],
          ),
          Row(
            children: [
              ExpenseCard(iconData: Icons.construction, title: 'Maintenance', description: '108 tips vehicles', date: '30/06/2020', amount: '6,50,202'),
              ExpenseCard(iconData: Icons.receipt_long, title: 'Penalty', description: '12 States', date: '30/06/2020', amount: '15,000'),
              ExpenseCard(iconData: Icons.confirmation_num_outlined, title: 'Miscellaneous', description: '108 tips vehicles', date: '20/06/2020', amount: '10,000'),

            ],
          )
        ],
      ),
    );
  }
}

class NonTripExpenses extends StatefulWidget {
  const NonTripExpenses({Key key}) : super(key: key);

  @override
  _NonTripExpensesState createState() => _NonTripExpensesState();
}

class _NonTripExpensesState extends State<NonTripExpenses> {
  @override
  Widget build(BuildContext context) {
    return TripExpenses();
  }
}

class ExpenseCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;
  final String date;
  final amount;

  ExpenseCard({
    @required this.iconData,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 330,
      padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2.0,))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                child: Container(
                  height: 80,
                  width: 70,
                  child: Icon(iconData, size: 40,),
                  decoration: BoxDecoration(
                    color: Colors.redAccent[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 13,
                  child:
                Container(
                  padding: EdgeInsets.all(2),
                  width: 55,
                  decoration: BoxDecoration(
                      color: Colors.purple[900],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" 5%", style: TextStyle(color: Colors.white),),
                      Icon(Icons.arrow_drop_up_sharp, color: Colors.green,)
                    ],
                  ),


              ))
            ],
          ),
          Container(
            width: (160),
            padding: const EdgeInsets.fromLTRB(10, 10,0, 0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),
                Text(description, style: TextStyle(color: Colors.grey, fontSize: 11,),),
                Text("Last on $date", style: TextStyle(color: Colors.grey, fontSize: 11,),)

              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),),
              Container(
                width: 80,
                height: 35,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                  child: TextButton(onPressed: (){}, child: Text("Add", style: TextStyle(color: Colors.white),),),
              ),
            ],

          ),
        ],
      ),
    );
  }
}




