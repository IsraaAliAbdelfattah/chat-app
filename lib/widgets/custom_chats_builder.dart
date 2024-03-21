import 'package:chatapp/componant/chat_model.dart';
import 'package:chatapp/views/constance.dart';
import 'package:flutter/material.dart';

class CustomChatBuilder extends StatelessWidget {
  const CustomChatBuilder({super.key, required this.chatModel});
final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(chatModel.image),
        Column(
          children: [
            Text(chatModel.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text(chatModel.message,style: TextStyle(color: Colors.grey),),
            Divider(
              color: kPrimarycolor,
              thickness: 2,
            ),
          ],
        ),
      ],
    );
  }
}