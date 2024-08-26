import 'package:firebase/ui.dart';
import 'package:firebase/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController OtpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
    child: Container(
    margin: EdgeInsets.only(top: 40),
    child: Column(

    children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
    controller: OtpController,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.verified_user_outlined),
    label: Text("Enter OTP"),
    border: OutlineInputBorder(
    borderSide: BorderSide(
    width: 5,
    color: Colors.black,
    ),
    borderRadius: BorderRadius.circular(20),
    )
    ),
    ),
    ),
    SizedBox(height: 30,),
      ElevatedButton(onPressed: () async{
        try{
          final cred = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: OtpController.text.toString() );
          FirebaseAuth.instance.signInWithCredential(cred).then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsUi(),));
          },);

        } catch (e){
          Utils().toastMessage(e.toString());
        }
      }, child: Text("Verfiy"))
      ]
      )
    )
    )
    );
  }
}
