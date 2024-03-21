import 'package:chatapp/models/message.dart';
import 'package:chatapp/views/constance.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({
    super.key,
    required this .message
  });
Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.only(left: 16,top:16,bottom: 16,right: 16),
           decoration: BoxDecoration(
            color: kPrimarycolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight:Radius.circular(32) ,
            ),
          ),
          child: Text(message.message,style: TextStyle(
          
          ),),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
   ChatBubbleForFriend({
    super.key,
    required this .message
  });
Messages message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.only(left: 16,top:16,bottom: 16,right: 16),
           decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft:Radius.circular(32) ,
            ),
          ),
          child: Text(message.message,style: TextStyle(
          
          ),),
        ),
      ),
    );
  }
}
