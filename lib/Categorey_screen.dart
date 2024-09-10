import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled3/provider/api_provider.dart';
import 'package:untitled3/screens/catproduct_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final Random _random = Random();

  // Function to generate a random color
  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  List<String> categories = [];
  bool isLoading = true;

  getCategories() async {
    categories = (await ApiProvider().getCategories())!;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color(0xffffb301),
        elevation: 0,
        automaticallyImplyLeading: false,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CatproductScreen(
                      category: categories[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _getRandomColor(),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: CategoryBuild(
                  name: categories[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget CategoryBuild({required String? name}) => Container(
  padding: const EdgeInsets.all(15),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.transparent,
        Colors.black.withOpacity(0.6),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    borderRadius: BorderRadius.circular(15),
  ),
  child: Center(
    child: Text(
      name ?? '',
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: Colors.black,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
    ),
  ),
);
