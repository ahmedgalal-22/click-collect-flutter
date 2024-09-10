import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/bottombar_screen.dart';
import 'package:untitled3/login_screen.dart';
import 'package:untitled3/provider/api_provider.dart';
import 'package:untitled3/splask_screeen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool pass = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050522),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: const Color(0xff050522),
                  child: Center(
                    child: Image.asset(
                      'assets/image 1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black.withOpacity(.6),
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
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            IconButton(
                              color: Colors.redAccent,
                              icon: const Icon(
                                Icons.close,
                                size: 35,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SplashScreen(),
                                    ));
                              },
                            ),
                          ],
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            labelText: 'User name',
                            prefixIcon: const Icon(Icons.person_outline_rounded),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: TextFormField(
                            controller: passController,
                            obscureText: pass,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    pass = !pass;
                                  });
                                },
                                icon: Icon(pass
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottombarScreen()));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff050522),
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xffFFDE69),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have account? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
