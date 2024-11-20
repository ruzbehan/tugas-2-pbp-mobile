import 'package:flutter/material.dart';
import 'package:product_mobile/screens/list_product.dart';
import 'package:product_mobile/screens/menu.dart';
import 'package:product_mobile/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Product Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Kelola produkmu dengan mudah dan efisien!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Redirection ke halaman utama
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Item'),
            // Redirection ke halaman formulir tambah item
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItemFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Daftar Item'),
            // Redirection ke halaman daftar item
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemListPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
