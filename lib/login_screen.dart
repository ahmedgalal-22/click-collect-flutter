import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/bottombar_screen.dart';
import 'package:untitled3/sign_screen.dart';
import 'package:untitled3/splask_screeen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool pass = true;
  final formKey = GlobalKey<FormState>();
  String? errorMessage;

  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050522),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color(0xff050522),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image 1.png',
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            color: Colors.redAccent,
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SplashScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passController,
                        obscureText: pass,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                pass = !pass;
                              });
                            },
                            icon: Icon(
                                pass ? Icons.visibility_off : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                          },
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff050522)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (errorMessage != null) ...[
                        Text(
                          errorMessage!,
                          style: const TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                      ],
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const BottombarScreen()),
                                );
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  errorMessage = 'Invalid email or password.';
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff050522),
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffFFDE69),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? ", style: TextStyle(fontSize: 16)),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
