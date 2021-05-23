import 'package:flutter/material.dart';

class ExpenseCategories extends StatefulWidget {
  const ExpenseCategories({Key key}) : super(key: key);

  @override
  _ExpenseCategoriesState createState() => _ExpenseCategoriesState();
}

class _ExpenseCategoriesState extends State<ExpenseCategories> {
  List<String> categories = [
    'ALL', 'FUEL', 'MAINTENANCE', 'PENALTY', 'TOLL CHARGES',
    'MISCELLANEOUS', 'DRIVER COMMISSION', 'RTO',
  ];

  // By default first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(

        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical:0.0, horizontal: 20.0) ,
        margin: EdgeInsets.symmetric(vertical:0.0,horizontal:5.0),
        decoration: BoxDecoration(
          color:
          selectedIndex == index ? Colors.black : Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey, width: 1),

        ),
        child: Text(
          categories[index],
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
