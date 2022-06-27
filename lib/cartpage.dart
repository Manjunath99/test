import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testforidde/main.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        title: Text("Cart page"),

      ),
      body:Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(cart.items[i]),
                  trailing:  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ))
                  ,
                );
              });
        },
      ) ,
    );

  }
}
