import 'package:flutter/material.dart';
import 'package:untitled3/provider/api_provider.dart';
import 'package:untitled3/provider/models/cart_model.dart';
import 'package:untitled3/screens/cartproduct_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Carts? _carts;

  @override
  void initState() {
    super.initState();
    getCarts().then((data) {
      print(data);

      setState(() {
        _carts = data ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all( 15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text('Carts',
                style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700,color: Color(0xff050522),
                ),
              ),
            ),
            _carts == null
                ? const Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                  child: ListView.builder(
                            itemCount: _carts!.carts?.length ?? 0,
                            itemBuilder: (context, index) {
                  final cart = _carts!.carts![index];
                  return ListTile(
                    title: Text('Cart ID: ${cart.id}',style: TextStyle(fontSize: 23),),
                    subtitle: Text('Total: \$${cart.total} ',style: TextStyle(fontSize: 18),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartproductScreen(cart: cart),
                        ),
                      );
                    },
                  );
                            },
                          ),
                ),
          ],),
        ),
      )

    );
  }
}
