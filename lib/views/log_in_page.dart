import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatapp/helper/show_snakbar.dart';
import 'package:chatapp/views/constance.dart';
import 'package:chatapp/views/sign_up_page.dart';
import 'package:chatapp/views/chat_page.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/text_filed_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});
  static String id ='Log in Page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String? email;

  String? password;

  bool isloading=false;
GlobalKey<FormState> formkey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimarycolor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Image.asset(Klogo),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 85),
                child: Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 10),
                child:  Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
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
                text: 'Password',
                hinttext: 'Enter password',
               onChanged: (data){
                password=data;
               },
                padding: 220,
              ),
              const SizedBox(
                height: 20,
              ),
               CustomButton(text: 'Sign in',
              onPressed:()async{
                  if (formkey.currentState!.validate()) {
                    isloading=true;
                    setState(() {
                      
                    });
            try {
              await LoginMethod(context);
              showSnackBar(context, 'Logged in Succesfully');
              setState(() {
                
              });
             
              Navigator.of(context).pushNamedAndRemoveUntil(ChatPage.id, (route) => false,arguments: email);
            } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ShowMessage(context,'No user found for that email.');
            log('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            ShowMessage(context,'Wrong password provided for that user.' );
            log('Wrong password provided for that user.');
          }
            } catch (e) {
          log(e.toString());
            }
            isloading=false;
              }
              }
               ),
           SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: const Text(
                      '  sign up',
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

  Future<void> LoginMethod(BuildContext context) async {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email! ,
        password:password! ,
      );
      
  }
  
}





