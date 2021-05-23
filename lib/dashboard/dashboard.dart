import 'package:fleet_management_app/controls/controls.dart';
import 'package:fleet_management_app/dashboard/ExpenseCategories.dart';
import 'package:fleet_management_app/dashboard/ExpenseDetails.dart';
import 'package:fleet_management_app/dashboard/ExpenseGraphs.dart';
import 'package:fleet_management_app/dashboard/TripsRunning.dart';
import 'package:fleet_management_app/dashboard/dashboardstats.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        textTheme: GoogleFonts.montserratTextTheme(),
        toolbarHeight: 110,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            SizedBox(height: 35,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Text("Hello, ", style: TextStyle(color: Colors.black, fontSize: 40),),
                            Text("Anant", style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold, fontSize: 40),),
                          ],
                        ),
                        Text("Lets see how your business is doing", style: TextStyle(color: Colors.grey, fontSize: 12),)
                      ],
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Controls()));
                    },
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                        child: Column(
                          children: [Icon(Icons.grain, color: Colors.black,size: 30,), Text("Controls", style: TextStyle(color: Colors.grey, fontSize: 12),)],
                    ),
                    ),
                  ],
                ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  DashboardStatistics(),
                  ExpenseCategories(),
                  ExpenseGraph(),
                  ExpenseDetails(),
                  TripsRunning(),
                  SizedBox(height: 60,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),


                ),
                child: Row(
                  children: [
                    SizedBox(width:20),
                    Icon(Icons.segment, color: Colors.grey,),
                    Text("   Trip, vehicle, driver", style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed:(){},
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }
}
