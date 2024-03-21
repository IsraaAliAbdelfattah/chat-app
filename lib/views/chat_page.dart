import 'dart:developer';

import 'package:chatapp/models/message.dart';
import 'package:chatapp/views/constance.dart';
import 'package:chatapp/views/log_in_page.dart';
import 'package:chatapp/widgets/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
   CollectionReference messages =
    FirebaseFirestore.instance.collection(kmessagescollection);

  TextEditingController mycontroller=TextEditingController();
final _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    var email=ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kcreatedAt,descending: true).snapshots(),
     builder:(context,snapshot)
     {
     print(snapshot.data);
     if(snapshot.hasData){
        List<Messages> messagesList=[];
        for(int i=0;i<snapshot.data!.docs.length;i++){
          messagesList.add(Messages.fromjson(snapshot.data!.docs[i]));
        }
         return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Klogo,height: 60,),
           Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: ()async{
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context,LogInPage.id, (route) => false);
              },
              child: Text('Logout')),
          ],
        ),
        backgroundColor: kPrimarycolor,
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _controller,
              itemCount: messagesList.length,
              itemBuilder: (context,index){
                return messagesList[index].id==email? ChatBubble(
                  message: messagesList[index],
                ):ChatBubbleForFriend(
                  message: messagesList[index],
                );
                
            }),
            
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: mycontroller,
              onFieldSubmitted: (data){
                messages.add({
                  'message':data,
                  'createdAt':DateTime.now(),
                  'id':email,
                  });
                  mycontroller.clear();
                  _controller.animateTo(
               0,
                curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
 );
              },
                decoration:InputDecoration(
                  hintText: 'Send messsage',
                  suffixIcon: Icon(Icons.send,color: kPrimarycolor,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
               enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
               borderSide: BorderSide(color:kPrimarycolor),
               )
            ),
            ),
          ),
        ],
      ),
      
    );
     }
     else{
      return Text('Loading');
     }
    },);
  }
}

