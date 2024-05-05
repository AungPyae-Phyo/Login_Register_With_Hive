import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WelcomePage extends StatefulWidget {
  // const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final box = Hive.box('userBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(7),
                title: Text(
                  "User Name: " + box.get('username'),
                ),
              ),
            ),

            Card(
              elevation: 4, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(7),
                title: Text(
                  "Email: " + box.get('email'),
                ),
              ),
            ),

            Card(
              elevation: 4, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(7),
                title: Text(
                  "Password: " + box.get('password'),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
