import 'package:flutter/material.dart';
import 'package:product_mobile/menu.dart'; // Untuk rute ke halaman utama
import 'package:product_mobile/add_item_form.dart'; // Untuk rute ke halaman tambah item


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: const Color.fromARGB(255, 211, 206, 206)),
            child: Text(
              'Navigasi',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Halaman Utama"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Tambah Item"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddItemForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}
