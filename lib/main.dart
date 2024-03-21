import 'dart:developer';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/home_page.dart';
import 'package:chatapp/views/log_in_page.dart';
import 'package:chatapp/views/sign_up_page.dart';
import 'package:chatapp/views/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
    } else {
      log('User is signed in!');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpPage.id:(context)=>SignUpPage(),
        ChatPage.id:(context) => ChatPage(),
        LogInPage.id:(context) => LogInPage(),
      },
      home:FirebaseAuth.instance.currentUser==null? LogInPage():HomePage(),
    );
  }
}
