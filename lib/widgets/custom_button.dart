import 'package:chatapp/views/constance.dart';
import 'package:chatapp/views/chat_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: MaterialButton(
        color: Colors.white,
        textColor: kPrimarycolor,
        height: 40,
        minWidth: 350,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key, required this.text, required this.icon, this.onPressed});
final String text;
final String icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
               child: MaterialButton(
                color: Colors.white,
               textColor: kPrimarycolor,
                height: 40,
                 minWidth: 350,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  onPressed: onPressed,
                  child:  Row(
                    children: [
                     Text(
                      text,
                        style:  const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                     Image.asset(icon,height: 30,),
                    ],
                  ),
                  ),
             );
  }
}