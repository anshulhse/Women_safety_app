import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_final_project/child/child_login_screen.dart';
import 'package:women_safety_final_project/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  goTo(context, LoginScreen());
                } on FirebaseAuthException catch (e) {
                  dialogBox(context, e.toString());
                }
              },
              child: Text(
                "SING OUT",
              ))),
    );
  }
}
