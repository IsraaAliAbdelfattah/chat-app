import 'package:chatapp/views/log_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('viewuserName'), accountEmail: Text('viewemail'),
        /*  currentAccountPicture: ClipRRect(
            child: ClipOval(
              child: Image.asset('assets/satoro.png',height: 90,width: 90,
              fit: BoxFit.fill,),
            ),
          ),
*/
          ),

          ListTile(
            contentPadding: EdgeInsets.only(bottom: 10),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){

            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 10),
            leading: Icon(Icons.info),
            title: Text('about'),
            onTap: (){

            },
          ),
          Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: ListTile(
              contentPadding: EdgeInsets.only(bottom: 10),
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
             onTap: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamedAndRemoveUntil(LogInPage.id, (route) => false);
        },
            ),
          ),
         
        ],
      ),
    );
  }
}
