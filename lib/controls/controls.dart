import 'package:flutter/material.dart';

class Controls extends StatefulWidget {
  const Controls({Key key}) : super(key: key);

  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        title: Text(
          "Select the Category",
          style: TextStyle(color: Colors.blue[800], fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              height: MediaQuery.of(context).size.height*0.68,
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.1,crossAxisSpacing: 30),
                children: [
                  CardType2(icon:Icons.all_inclusive,text: 'Trips'),
                  CardType2(icon:Icons.local_shipping,text: 'Vehicles'),
                  CardType2(icon:Icons.person,text: 'Drivers'),
                  CardType2(icon:Icons.group,text: 'Customers'),
                  CardType2(icon:Icons.update,text: 'Services'),
                  CardType2(icon:Icons.settings,text: 'Settings'),
                  CardType2(icon:Icons.support_agent,text: 'Support'),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width*0.7,
            child: TextButton(onPressed: (){}, child: Text("LOGOUT", style: TextStyle(color: Colors.black),),),
          )
        ],
      ),
    );
  }
}

class CardType2 extends StatelessWidget {

  final IconData icon;
  final String text;

  CardType2({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal:10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: 2, blurRadius: 2, offset: const Offset(0.0,2.0))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.indigo[900],),
            Text(text, style: TextStyle(color: Colors.indigo[900]),),
          ],
        ),
      );
  }
}
