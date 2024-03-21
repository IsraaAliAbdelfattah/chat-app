import 'package:chatapp/views/constance.dart';
import 'package:flutter/material.dart';
class NormalTextFieldWidget extends StatelessWidget {
   NormalTextFieldWidget({super.key, required this.text, required this.hinttext, required this.padding, this.onChanged});
final String hinttext;
final String text;
final double padding;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        children: [
           Padding(
             padding:  EdgeInsets.only(right: padding),
             child: Text(
               text,
               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
             ),
           ),
          TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return 'value is required';
              }
            },
        
            onChanged: onChanged,
            decoration: InputDecoration(
               hintText:hinttext,
              border:const OutlineInputBorder(
                 borderRadius:BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                  color:kPrimarycolor,
                ),
              ),
              enabledBorder:const OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  color:kPrimarycolor,
                ),
                
              ),
             contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 20),
              hintStyle:const TextStyle(color: kPrimarycolor),
              filled: true,
              fillColor: const Color.fromARGB(255, 236, 234, 234),
            ),
          ),
        ],
      ),
    );
  }
}
class PasswordTextFieldWidget extends StatelessWidget {
   PasswordTextFieldWidget({super.key, required this.text, required this.hinttext, required this.padding, this.onChanged});
final String hinttext;
final String text;
final double padding;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        children: [
           Padding(
               padding:  EdgeInsets.only(right: padding),
               child: Text(
                 text,
                 style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
               ),
             ),
          TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return 'value is required';
              }
            },
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
               hintText:hinttext ,
              border:const OutlineInputBorder(
                 borderRadius:BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                  color:kPrimarycolor,
                ),
              ),
              enabledBorder:const OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(6)),
                 borderSide: BorderSide(
                  color:kPrimarycolor,
                ),
              ),
             
              contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 20),
              hintStyle: const TextStyle(color: kPrimarycolor),
              filled: true,
              fillColor: const Color.fromARGB(255, 236, 234, 234),
            ),
          ),
        ],
      ),
    );
  }
}