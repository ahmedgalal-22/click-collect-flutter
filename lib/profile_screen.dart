import 'package:flutter/material.dart';
import 'package:untitled3/login_screen.dart';
import 'package:untitled3/screens/privacy_Screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff050522)),
              ),
              const SizedBox(height: 80),
              const ListTile(
                leading: Icon(Icons.person_outline, size: 30),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyScreen()));
                },
                leading: const Icon(Icons.privacy_tip_outlined, size: 30),
                title: const Text(
                  ' Privacy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              const ListTile(
                leading: Icon(Icons.lock_outline, size: 30),
                title: Text(
                  'Security',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              const ListTile(
                leading: Icon(Icons.notifications_none, size: 30),
                title: Text(
                  'Notification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              const ListTile(
                leading: Icon(Icons.info_outline_rounded, size: 30),
                title: Text(
                  'About ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.red,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
