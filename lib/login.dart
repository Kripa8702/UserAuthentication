import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/otp.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  TextEditingController _controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          ),
       ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              child : Center(
                child: Text('Please enter your mobile number',
                  style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w800, fontSize: 24),
                ),
              )
            ),
              Container(
              margin: EdgeInsets.only(top: 10),
              width: 200,
              child : Center(
                child: Text('You\'ll recieve a 6-digit code to verify next',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Urbanist',fontSize: 16,color: Colors.grey),
                ),
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(0.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+91 - ',
                    style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ),maxLength: 10,
                style: TextStyle(fontFamily: 'Urbanist'),
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
            ]),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 50,
              child: FlatButton(
                color: const Color(0xff1B3354),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OTPScreen(_controller.text)));
                },
                child: Text('CONTINUE',
                style: TextStyle(fontFamily: 'Urbanist',fontWeight: FontWeight.w800, color: Colors.white, fontSize: 20),
                ),
              )
            ),
          ],
        ),
    );
  }
}