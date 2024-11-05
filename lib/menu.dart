import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    final String npm = '2306245062';
    final String name = 'Muhammad Ruzbehan Baqli';
    final String className = 'PBP E';

    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag, Colors.grey),
        ItemHomepage("Tambah Produk", Icons.add, Colors.green),
        ItemHomepage("Logout", Icons.logout, Colors.red),
    ];

    MyHomePage({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                colorScheme: ColorScheme.light().copyWith(
                    primary: Colors.black,
                    secondary: Colors.teal,
                ),
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: const Text(
                        'E Commers Persatean',
                        style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                ),
                body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    InfoCard(title: 'NPM', content: npm),
                                    InfoCard(title: 'Name', content: name),
                                    InfoCard(title: 'Class', content: className),
                                ],
                            ),
                            const SizedBox(height: 16.0),
                            Center(
                                child: Column(
                                    children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 16.0),
                                            child: Text(
                                                'Selamat datang di toko sate Behan',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                ),
                                            ),
                                        ),
                                        GridView.count(
                                            primary: true,
                                            padding: const EdgeInsets.all(20),
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 3,
                                            shrinkWrap: true,
                                            children: items.map((ItemHomepage item) {
                                                return ItemCard(item);
                                            }).toList(),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}

class InfoCard extends StatelessWidget {
    final String title;
    final String content;

    const InfoCard({super.key, required this.title, required this.content});

    @override
    Widget build(BuildContext context) {
        return Card(
            color: Colors.black,
            elevation: 3.0,
            child: Container(
                width: MediaQuery.of(context).size.width / 3.5,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        Text(
                            title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                            content,
                            style: const TextStyle(color: Colors.white),
                        ),
                    ],
                ),
            ),
        );
    }
}

class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
    final ItemHomepage item;

    const ItemCard(this.item, {super.key});

    @override
    Widget build(BuildContext context) {
        return Material(
            color: item.color,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
                onTap: () {
                    String message = "";
                    switch (item.name) {
                        case "Lihat Daftar Produk":
                            message = "Kamu telah menekan tombol Lihat Daftar Produk";
                            break;
                        case "Tambah Produk":
                            message = "Kamu telah menekan tombol Tambah Produk";
                            break;
                        case "Logout":
                            message = "Kamu telah menekan tombol Logout";
                            break;
                    }
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text(message)),
                        );
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(
                                    item.icon,
                                    color: Colors.white,
                                    size: 30.0,
                                ),
                                const Padding(padding: EdgeInsets.all(3)),
                                Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
