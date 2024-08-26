import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/StoryPage.dart';
import 'package:firebase/ui.dart';
import 'CallsPage.dart';

class Groupspage extends StatefulWidget {
  const Groupspage({super.key});

  @override
  State<Groupspage> createState() => _GroupspageState();
}

class _GroupspageState extends State<Groupspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            Center(
              child: SafeArea(
                child: Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("WhatsApp", style: TextStyle(color: Colors.white, fontSize: 30),),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                              }, icon: Icon(Icons.camera_alt_outlined,color: Colors.white,)),


                              DropdownButton<String>(
                                icon: Icon(Icons.more_vert_sharp),
                                items: <String>['Button'].map((String Value){
                                  return DropdownMenuItem<String>(value: Value, child: Column(children:[TextButton(onPressed: (){}, child: Text("Click me"))]));
                                }).toList(), onChanged: (String? value) {  },)
                            ],),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                style: TextStyle(color: Colors.white,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  prefixIcon: Icon(CupertinoIcons.infinite,size: 30,),
                  prefixIconColor: Colors.purple,
                  enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  ) ,
                  filled: true,
                  hintText: "Ask Meta Ai or Search",
                  fillColor: CupertinoColors.opaqueSeparator.darkHighContrastElevatedColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              child : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :[
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => WhatsUi(),));
                            },
                            icon: Icon(
                              Icons.chat,
                              color: Colors.white,
                            )),
                        Text("Chats",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage(),));},
                            icon: Icon(Icons.history_toggle_off_rounded,
                                color: Colors.white)),
                        Text("Upadates", style: TextStyle(color:Colors.white),)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Groupspage(),));
                            },
                            icon: Icon(Icons.group_add, color: Colors.white)),
                        Text("Communities", style: TextStyle(color:Colors.white),)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => CallsPage(),));
                            },
                            icon: Icon(Icons.call, color: Colors.white)),
                        Text("Calls", style: TextStyle(color:Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
