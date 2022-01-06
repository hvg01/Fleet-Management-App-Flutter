import 'package:flutter/material.dart';

class TripsRunning extends StatefulWidget {
  const TripsRunning({Key key}) : super(key: key);

  @override
  _TripsRunningState createState() => _TripsRunningState();
}

class _TripsRunningState extends State<TripsRunning> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text("Trips Running", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            TripCard(tripId: 2022, currentState: "RUNNING- ETA 7 JULY",statusColor: Colors.black, from:" 61, 5 main APMC yard", to: " Jindal Steel Works", vehicleNo: "KA 32 M 2013", billing: "12,34,978", progress: 0.8,),
            TripCard(tripId: 2023, currentState: "COMPLETED", statusColor: Colors.green, from: " 61, 5th Street", to: " Jindal Steel Works", vehicleNo: "KA 32 M 2014", billing: "12,34,978", progress: 1.0,)
          ],
        );
  }
}

class TripCard extends StatelessWidget {

  final int tripId;
  final String currentState;
  final Color statusColor;
  final String from;
  final String to;
  final String vehicleNo;
  final billing;
  final double progress;

  TripCard({
    @required this.tripId,
    @required this.currentState,
    @required this.statusColor,
    @required this.from,
    @required this.to,
    @required this.vehicleNo,
    @required this.billing,
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 7.0, offset: Offset(0.0, 7.0))]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TRIP ID $tripId", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  Text("Today 3:30PM", style: TextStyle(color: Colors.grey, fontSize: 10),)
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: statusColor,
                child: Text(currentState, style: TextStyle(color: Colors.white, fontSize: 12),),
              ),
            ],
          ),
          SizedBox(height: 35,),
          Row(
            children: [
              Container(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(

                      children: [
                        Icon(Icons.arrow_upward_rounded, color: Colors.grey,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(from, style: TextStyle(color: Colors.grey[800], fontSize: 16),),
                            Text("  Banglore", style: TextStyle(color: Colors.grey, fontSize: 11),)
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_vert, color: Colors.grey,),
                    Row(
                      children: [
                        Icon(Icons.arrow_downward_rounded, color: Colors.green,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(to, style: TextStyle(color: Colors.grey[800], fontSize: 16),),
                            Text("  Mumbai", style: TextStyle(color: Colors.grey, fontSize: 11),)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [

                      Text("Vehicle No", style: TextStyle(color: Colors.black, fontSize: 12),),
                      Text(vehicleNo, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30),
                      Text("Total Billing", style: TextStyle(color: Colors.black, fontSize: 12),),
                      Text(billing, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: progress==1?
            new AlwaysStoppedAnimation<Color>(Colors.green)
            : new AlwaysStoppedAnimation<Color>(Colors.black),
          )
        ],
      ),
    );
  }
}


