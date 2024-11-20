import 'package:flutter/material.dart';
import 'package:product_mobile/models/product_entry.dart';
import 'package:product_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  Future<List<ItemEntry>> fetchItems(CookieRequest request) async {
    // Ganti URL dengan endpoint yang sesuai
    final response = await request.get('http://127.0.0.1:8000/json/items/');
    
    // Decode response menjadi bentuk JSON
    var data = response;
    
    // Konversi data JSON menjadi object ItemEntry
    List<ItemEntry> itemList = [];
    for (var d in data) {
      if (d != null) {
        itemList.add(ItemEntry.fromJson(d));
      }
    }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItems(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data item yang tersedia.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Jumlah: ${snapshot.data![index].fields.amount}"),
                      const SizedBox(height: 10),
                      Text("Deskripsi: ${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("Waktu: ${snapshot.data![index].fields.time}"),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
