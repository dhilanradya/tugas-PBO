import 'package:flutter/material.dart';
import 'AddProductPage.dart'; // Pastikan import halaman form

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/gojo.jpg',
      'name': 'Burger King Medium',
      'price': 'Rp.50.000,00',
    },
    {
      'image': 'assets/gojo.jpg',
      'name': 'Teh Botol',
      'price': 'Rp.4.000,00',
    },
    {
      'image': 'assets/gojo.jpg',
      'name': 'Burger King Small',
      'price': 'Rp.35.000,00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductFormPage()),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Add Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Text('Foto', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Nama Produk', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Harga', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image']!,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(child: Text(product['name']!)),
                          Expanded(child: Text(product['price']!)),
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}