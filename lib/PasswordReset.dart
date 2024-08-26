import 'package:firebase/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Passwordreset extends StatefulWidget {
  const Passwordreset({super.key});

  @override
  State<Passwordreset> createState() => _PasswordresetState();
}

class _PasswordresetState extends State<Passwordreset> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black12,foregroundColor: Colors.white,
      title:  Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          "Forgot Password?",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),centerTitle: true,),
      backgroundColor: Colors.black12,
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:
              TextFormField(
                controller: email,style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    label: Text("Enter Your Email", style: TextStyle(color: Colors.white),),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.toString()).then((Value){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Link Sent")));
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              }, child: Text("Send Reset link"))
            ],
          ),
        ),
      )),
    );
  }
}
