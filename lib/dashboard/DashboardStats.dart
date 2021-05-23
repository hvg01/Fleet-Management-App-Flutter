import 'package:flutter/material.dart';

class DashboardStatistics extends StatelessWidget {
  const DashboardStatistics({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: SizedBox(
        height: 280,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            CardType1(
                color: Colors.deepPurpleAccent[100],
                imgUrl: 'assets/billing.png',
                text1: "Total Billing",
                text2: "₹6,30,000",
                text3: "Your billing for the month increased by 5%"
            ),
            CardType1(
                color: Colors.grey[500],
                imgUrl: 'assets/trips.png',
                text1: "Total Trips",
                text2: "389",
                text3: "Number of trips for the month increased by 12%"
            ),
            CardType1(
                color: Colors.redAccent,
                imgUrl: 'assets/expense.png',
                text1: "Total Expense",
                text2: " ₹3,00,000",
                text3: "Your expense for the month decreased by 3.8%"
            ),
            CardType1(
                color: Colors.greenAccent[400],
                imgUrl: 'assets/profit.png',
                text1: "total",
                text2: "₹3,30,000",
                text3: "Your profits for the month increased by 5%"
            ),
          ],
        ),
      ),
    );
  }
}


class CardType1 extends StatelessWidget {

  final Color color;
  final String imgUrl;
  final String text1;
  final String text2;
  final String text3;

  CardType1({this.color, this.imgUrl, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      margin: EdgeInsets.symmetric(vertical:10.0,horizontal:7.0),
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
            Colors.white,
            color.withOpacity(0.8)
          ],radius: 0.6,focalRadius: 0.5, center: Alignment(0,-0.4)),
        borderRadius: BorderRadius.circular(40),
           boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: 0.0, blurRadius: 5.0, offset: const Offset(0,7.0) )],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgUrl, height: 80),
          SizedBox(height: 14,),
          Text(text1, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),),
          SizedBox(height: 5,),
          Text(text2, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          Text(text3, style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

}
