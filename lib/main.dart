import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testforidde/cartpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Shopping list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> listofproduct = [
    'Product1',
    "Product2",
    "Product3",
    "Product4",
    "Product5",
    "Product6"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: const Text(
              "Cart",
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            )),
      ]),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
              itemCount: listofproduct.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(listofproduct[i]),
                  trailing: cart.items.contains(listofproduct[i])
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ))
                      : TextButton(
                          onPressed: () {
                            print("helooo1111111");
                            cart.add(listofproduct[i]);
                          },
                          child: const Text("ADD"),
                        ),
                );
              });
        },
      ),
    );
  }
}

class CartModel extends ChangeNotifier {
  final List _items = [];

  UnmodifiableListView get items => UnmodifiableListView(_items);

  void add(item) {
    _items.add(item);
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
