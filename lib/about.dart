import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color(0xffffb301),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://scontent.fcai16-1.fna.fbcdn.net/v/t39.30808-6/404471903_2289827761367070_7390164931527501988_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=69fXV4gExF0Q7kNvgEb4PfM&_nc_ht=scontent.fcai16-1.fna&oh=00_AYCB0vTtEvCkVGjYG75UB86zsVYQtN7AYONDMtHobh2dmA&oe=66E0AEF7',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                // Name
                const Text(
                  'ahmed mohamed galal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Email
                const Text(
                  'ahmedgalal15962@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                // Phone number
                const Text(
                  '01226978647',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // Custom sentence
                const Text(
                  'St2024Flutter G6',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
