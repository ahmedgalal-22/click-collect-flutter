import 'package:flutter/material.dart';
import 'package:untitled3/Categorey_screen.dart';
import 'package:untitled3/cart_screen.dart';
import 'package:untitled3/home_screen.dart';
import 'package:untitled3/profile_screen.dart';

class BottombarScreen extends StatefulWidget {
  const BottombarScreen({super.key});

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int currentScreen = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffFFDE69),
          borderRadius: BorderRadius.only( topLeft: Radius.circular(40),
            topRight: Radius.circular(40),),
          boxShadow: [

            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xffffb301),

            selectedFontSize: 15,
            showUnselectedLabels: false,
            selectedItemColor: const Color(0xff050522)
          ,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: "Setting",
              ),
            ],
            currentIndex: currentScreen,
            onTap: (value) {
              setState(() {
                currentScreen = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
