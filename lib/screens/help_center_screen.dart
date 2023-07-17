import 'package:flutter/material.dart';
import 'package:myflutter/constants/colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Help Center'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Contact Us',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Email us at qifdgonzales@tip.edu.ph',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'FAQs',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Frequently Asked Questions',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Terms of Service',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Read our terms of service',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Read our privacy policy',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
