import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/my_flutter_app_icons.dart';

class Home extends StatefulWidget{

  @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home>{
    bool _value = false;
    bool _value2 = false;
    late String uid;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, bottom: 20),
              child: Center(
                child: Text('Please select your profile',
                  style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w800, fontSize: 24),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
            child: Column(
            children: [
              Row(
              //ROW 1
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _value
                          ? Icon(
                        Icons.circle,
                        size: 15.0,
                        color: Colors.black,
                      )
                          : Icon(
                        Icons.check_circle_outline,
                        size: 15.0,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.home_outlined,
                          size: 50.0,
                        ),
                      ),
                      ]
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20,top: 20),
                      child: Text('Shipper',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 18),
                     ),
                ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                      child: Text('Lorem ipsum dolor sit amet, \nconsectetur adipisicing elit.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w300, fontSize: 15),
                     ),
                ),
                ]
            ),

              ],
            ),
      ]
            ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
            child: Row(
              //ROW 2
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _value2 = !_value2;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _value2
                          ? Icon(
                        Icons.circle,
                        size: 15.0,
                        color: Colors.black,
                      )
                          : Icon(
                        Icons.check_box_outline_blank,
                        size: 15.0,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.local_shipping_outlined,
                          size: 50.0,
                        ),
                      ),
                    ]
                ),
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Transporter',
                    style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Text('Lorem ipsum dolor sit amet, \nconsectetur adipisicing elit.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                  ),
                ]
                ),

              ],
            ),
            ),
          ],
        )
      );
  }

    @override
    void initState() {
    //TODO: implement initState
      super.initState();
      uid = FirebaseAuth.instance.currentUser!.uid;
  }
}