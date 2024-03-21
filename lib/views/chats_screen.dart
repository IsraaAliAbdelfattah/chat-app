import 'package:chatapp/componant/chat_model.dart';
import 'package:chatapp/views/constance.dart';
import 'package:chatapp/widgets/custom_chats_builder.dart';
import 'package:flutter/material.dart';


class Chats extends StatelessWidget {
  const Chats({super.key});
final List<ChatModel> chatmodelList=const[
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
  ChatModel(image: 'assets/image/scholar.png', message: 'Hello', name: 'Satoro'),
            
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 60, 77),
      body: ListView.builder(
        itemCount: chatmodelList.length,
        itemBuilder: (context,index){
        return CustomChatBuilder(chatModel: chatmodelList[index]);
      }),
    );
  }
}