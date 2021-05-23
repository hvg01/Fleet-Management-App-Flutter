import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Track extends StatefulWidget {
  const Track({Key key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {

  bool buttonToggle;

  @override
  void initState() {
    super.initState();
    buttonToggle=false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/mapimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 100,
              left: 200,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_shipping, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        buttonToggle=!buttonToggle;
                      });
                    },
                  )
              )
          ),
          Positioned(
              top: 300,
              left: 120,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_shipping, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        buttonToggle=!buttonToggle;
                      });
                    },
                  )
              )
          ),
          Positioned(
              top: 410,
              left: 300,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_shipping, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        buttonToggle=!buttonToggle;
                      });
                    },
                  )
              )
          ),

          Positioned(
            bottom: 20,
              child: buttonToggle==true?
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,

                child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                    viewportFraction: 0.4

                      ),
                  items: [
                    VehicleCard(vehicleNo: "KA 32 M 2312",tripId: 3030,),
                    VehicleCard(vehicleNo: "KA 25 M 2022",tripId: 3011,),
                    VehicleCard(vehicleNo: "HR 11 C 2341",tripId: 2033,),
                    VehicleCard(vehicleNo: "MH 43 D 2345",tripId: 1256,),
                  ],
                ),
              )


                  : SizedBox(),
          ),

        ],
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {

  final String vehicleNo;
  final int tripId;

  VehicleCard({
    @required this.vehicleNo,
    @required this.tripId,
});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 190,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/truck_img.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vehicleNo, style: TextStyle(color: Colors.white, fontSize: 17),),
                    Text("TRIP ID $tripId",style: TextStyle(color: Colors.grey,fontSize: 12,))
                  ],
                ),
              
            ),

          ],
        ),
      ),
    );
  }
}
