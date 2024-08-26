import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/CallsPage.dart';
import 'package:firebase/GroupsPage.dart';
import 'package:firebase/ui.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black12,
        body: Stack(
          children:[ Column(
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
              Container(
                width: double.infinity,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top:  10),
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Icon(CupertinoIcons.person_alt_circle, color: Colors.white,size: 70,);
                  },scrollDirection: Axis.horizontal,
                    itemCount: 20,),
                ),
              ),

              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child:  ListView.builder(itemBuilder: (context, index) {
                    return ListTile( iconColor: Colors.white, textColor: Colors.white, leading: Icon(Icons.account_circle,size: 50,),title: Text("Channel"),subtitle: Text("abc"),trailing: Icon(Icons.check_circle_outlined));
                  },scrollDirection: Axis.vertical,
                    itemCount: 50,),
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
          ),]
        )
    );
  }
}
