import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/PhoneAuth/OtpScreen.dart';
import 'package:firebase/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController PhoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Phone no. Verification"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: PhoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                      label: Text("Enter Your Phone Number"),
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
            ElevatedButton(onPressed: () async {
              if(PhoneController.text != ""){
              auth.verifyPhoneNumber(verificationCompleted: (phoneAuthCredential) {}, verificationFailed: (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
              },
              phoneNumber: PhoneController.text,  
              codeSent: (verificationId, forceResendingToken) {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>OtpScreen(verificationId: verificationId,)));
              }, codeAutoRetrievalTimeout: (verificationId) {
                Utils().toastMessage(Text("Timeout").toString());
              },);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Your Phone Number")));
              }

            }, child:Text("Send Otp",))],
          ),
        ),
      ),
    );}
}
