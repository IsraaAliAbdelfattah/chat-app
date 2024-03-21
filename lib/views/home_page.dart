import 'package:chatapp/views/calls.dart';
import 'package:chatapp/views/chats_screen.dart';
import 'package:chatapp/views/constance.dart';
import 'package:chatapp/views/group.dart';
import 'package:chatapp/views/statues.dart';
import 'package:chatapp/widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   var currentindex=0;
  Widget buildAppBody({required int index}){
    switch(index){
      case 0:return const Chats();
      case 1:return const Group();
      case 2:return const Statues();
      case 3:return const Calls();
      default : return  const Chats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimarycolor,
        title:const  Row(
          children: [
            Text('Chat',style: TextStyle(color: Colors.white),),
          ],
        ),
        actions:const [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
          ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.search,color: Colors.white,),
          ),
        ],
      ),
      drawer: NavBar(),
      body: buildAppBody(index: currentindex),
   bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
   Widget buildBottomNavigationBar(){
    List<BottomNavigationBarItem> menuItem=[
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chatBubble',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Group',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            label: 'Updates',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ];
  return BottomNavigationBar(
    currentIndex: currentindex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: (index){
      setState(() {
        currentindex=index;
      });
    },
    unselectedItemColor: Colors.black,
    selectedItemColor: kPrimarycolor,
    items: menuItem
    );
  }
}

//add_a_photo_outlined
//camera_alt_outlined
//donut_large