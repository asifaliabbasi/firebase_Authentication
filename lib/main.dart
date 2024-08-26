import 'package:firebase/ui.dart';
import 'package:firebase/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(MyApp());

}

class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsUi(),
    );

  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController CpassController = TextEditingController();
  bool Loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SignUp",style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: CpassController,
                      decoration: InputDecoration(
                          label: Text("Confirm Password"),
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
                  FloatingActionButton(onPressed: () {
                    var email = emailController.text.toString();
                    var pass = passController.text.toString();
                    var Cpass = CpassController.text.toString();
                    const snackBar = SnackBar(
                      content: Text('Password does not Match'),
                    );

                    if (pass != Cpass) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if (email != "" && pass != "") {
                      auth.createUserWithEmailAndPassword(
                          email: email, password: pass).then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WhatsUi(),));
                      },).onError((error, stackTrace){
                        Utils().toastMessage(error.toString());});
                      }
                    else {
                      const snackBar = SnackBar(
                        content: Text('Fill All Feilds'),

                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },



                    child: Loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.black,): Icon(Icons.login)),
                  SizedBox(height: 30,),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
                  }, child: Text("Already have an account? Login"))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
