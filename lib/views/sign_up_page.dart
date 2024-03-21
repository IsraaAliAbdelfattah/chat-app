import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatapp/helper/show_snakbar.dart';
import 'package:chatapp/views/constance.dart';
import 'package:chatapp/views/chat_page.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/text_filed_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage(
      {super.key});
  static String id = 'Sign up Page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
String? email;

  String? password;

  String? username;

  bool isloading=false;

  GlobalKey<FormState> formkey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isloading ,
      child: Scaffold(
        backgroundColor: kPrimarycolor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  NormalTextFieldWidget(
                    text: 'User Name',
                    hinttext: 'Enter your user name',
                    onChanged: (data){
                       username=data;
                    },
                    padding: 200,
                  ),
                  NormalTextFieldWidget(
                    text: 'Email',
                    hinttext: 'Enter your email',
                   onChanged: (data){
                    email=data;
                   },
                    padding: 265,
                  ),
                  PasswordTextFieldWidget(
                    text: 'password',
                    hinttext: 'Enter password',
                   onChanged: (data){
                    password=data;
                   },
                    padding: 220,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                 CustomButton(text: 'Sign Up',
                 onPressed: ()async{
              if (formkey.currentState!.validate()) {
                isloading=true;
                setState(() {
                  
                });
        try {
          await RegisterMethod(context);
          showSnackBar(context, 'Email Created Sucessfully');
          setState(() {
            
          });
          Navigator.of(context).pushNamedAndRemoveUntil(ChatPage.id, (route) => false,arguments: email);
        } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowMessage(context,'The password provided is too weak.');
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ShowMessage(context,'The account already exists for that email.' );
        log('The account already exists for that email.');
      }
        } catch (e) {
      log(e.toString());
        }
        isloading=false;
      }
              
                 },),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' have an account ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '  Log in',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ],
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ShowMessage(BuildContext context,String message) {
    AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: message,
              
                  ).show();
  }

  Future<void> RegisterMethod(BuildContext context) async {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email! ,
        password:password! ,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Created Sucessfully'),),);
  }
}
