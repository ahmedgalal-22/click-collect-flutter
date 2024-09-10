import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy ',style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.w500
        ),),centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you.\n \nWe only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used. \n\n We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.\n\n We don’t share any personally identifying information publicly or with third-parties, except when required to by law.",
          style: TextStyle(fontSize: 19, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
