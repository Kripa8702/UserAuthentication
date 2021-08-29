import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:user_authentication/home.dart';

class OTPScreen extends StatefulWidget{
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>{
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationcode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color(0xff87CEFA),
    borderRadius: BorderRadius.circular(0.0),
    shape: BoxShape.rectangle,
    border: Border.all(
      width: 10,
      color:const Color(0xff87CEFA),
    ),
  );

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
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Center(
              child: Text('Verify Phone',
                  style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w800, fontSize: 24),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Text('Code is sent to ${widget.phone}',
                  style: TextStyle(fontFamily: 'Urbanist',fontSize: 16,color: Colors.grey),
              ),
            ),
          ),

    Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: PinPut(

        fieldsCount: 6,
        withCursor: true,
        textStyle: const TextStyle(fontFamily: 'Urbanist', fontSize: 25.0, color: Colors.white),
        eachFieldWidth: 53.0,
        eachFieldHeight: 55.0,
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
        onSubmit: (pin) async{
          try {
            await FirebaseAuth.instance.signInWithCredential(
                        PhoneAuthProvider.credential(verificationId: _verificationcode, smsCode: pin))
                          .then((value) async{
                            if(value.user!=null){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (route) => false);
                            }
                          });
          } catch (e) {
            FocusScope.of(context).unfocus();
            final snackBar = SnackBar(content: Text('Invalid OTP'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    ),
        ],
      ),
    );
  }
  _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async{
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value)async{
                if(value.user!=null){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);
                }
          });
        },
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationcode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID){
          setState(() {
            _verificationcode=verificationID;
          });
        },
        timeout: Duration(seconds: 60));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}