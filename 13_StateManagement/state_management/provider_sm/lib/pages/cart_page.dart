import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          const ListTile(
            title: Text('Apple'),
          ),
          const ListTile(
            title: Text('Orange'),
          ),
          const ListTile(
            title: Text('Pear'),
          ),
        ],
      ),
    );
  }
}
