import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'GroupsPage.dart';
import 'StoryPage.dart';
import 'package:camera/camera.dart';
import 'CallsPage.dart';

class WhatsUi extends StatefulWidget {
  const WhatsUi({super.key});

  @override
  State<WhatsUi> createState() => _WhatsUiState();
}

class _WhatsUiState extends State<WhatsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                        Text(
                          "KeepemUpdate",
                          style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.w700),
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      ImagePicker();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
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
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    size: 30,
                  ),
                  prefixIconColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  filled: true,
                  hintText: "Seach Contacts",
                  fillColor: CupertinoColors
                      .opaqueSeparator.darkHighContrastElevatedColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.perm_identity,
                          size: 50,
                        ),
                        title: Text("Name"),
                        subtitle: Text("Xyz"),
                        trailing: Icon(Icons.mark_unread_chat_alt),
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );
                    },
                    itemCount: 50),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WhatsUi(),
                                  ));
                            },
                            icon: Icon(
                              Icons.chat,
                              color: Colors.white,
                            )),
                        Text(
                          "Chats",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoryPage(),
                                  ));
                            },
                            icon: Icon(Icons.history_toggle_off_rounded,
                                color: Colors.white)),
                        Text(
                          "Upadates",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Groupspage(),
                                  ));
                            },
                            icon: Icon(Icons.group_add, color: Colors.white)),
                        Text(
                          "Communities",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CallsPage(),
                                  ));
                            },
                            icon: Icon(Icons.call, color: Colors.white)),
                        Text(
                          "Calls",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,items: List.generate(3, (index) {
        return BottomNavigationBarItem(icon:Icon(Icons.add,color: Colors.white,) ,label: "Add",backgroundColor: Colors.white);
      },)),
    );
  }
}
