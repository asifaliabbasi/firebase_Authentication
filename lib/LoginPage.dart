import 'package:firebase/PasswordReset.dart';
import 'package:firebase/PhoneAuth/PhoneAuth.dart';
import 'package:firebase/main.dart';
import 'package:firebase/ui.dart';
import 'package:firebase/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}
class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    label: Text("Enter Your Email"),
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
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    label: Text("Enter Your Password"),
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
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 220),
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Passwordreset(),));
                  }, child: Text("Forgot Password")),
            ),
            ElevatedButton(onPressed: (){
              var email = emailController.text.toString();
              var pass = passController.text.toString();
              const snackBar = SnackBar(
                content: Text('Please Fill both feilds'),
              );
              if(email != ""&& pass != ""){
              auth.signInWithEmailAndPassword(email: email, password: pass).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>WhatsUi() ,));
                 },).onError((error, stackTrace){
                   Utils().toastMessage(error.toString());
                });}
              //   on FirebaseException catch (e){
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

                else{
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }},style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(Colors.black)),
                child: Text("Login",style: TextStyle(color: Colors.white),),),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupPage(),));
            }, child: Text("Don't have an account? Register Now",style: TextStyle(color:Colors.black),)),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuth(),));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 20,
                          child: Icon(Icons.phone),),
                      SizedBox(width: 20,),
                      Text("Continue with Phone Number"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                auth.signInWithProvider(GoogleAuthProvider()).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsUi(),));
                },);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                          width: 20,
                          child: Image.asset("images/google-logo-9827.png")),
                      SizedBox(width: 20,),
                      Text("Signin With Google"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
