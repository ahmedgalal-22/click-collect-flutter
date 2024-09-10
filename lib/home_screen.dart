import 'package:flutter/material.dart';
import 'package:untitled3/provider/api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  getproduct() async {
    productsList = await ProductsApi().getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff050522),
        title: Image.asset(
          'assets/image 1.png',
          height: 50, //
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.black54),
                  SizedBox(width: 10),
                  Text('Search', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            isLoading
                ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: productsList!.products!.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Container(
                        height: 150, // Adjust height as needed
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.7),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ProductBuild(
                          name: productsList!.products![index].title!,
                          price:
                          productsList!.products![index].price!.toString(),
                          image: productsList!.products![index].thumbnail!,
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ProductBuild({
  required String name,
  required String price,
  required String image,
}) =>
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(image),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
