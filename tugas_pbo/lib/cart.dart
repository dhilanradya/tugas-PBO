import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                    imageUrl: 'assets/gojo.jpg', // Path gambar harus ada di pubspec.yaml
                    title: 'Burger King Medium',
                    price: 50000,
                    quantity: 1,
                  ),
                  CartItem(
                    imageUrl: 'assets/gojo.jpg', 
                    title: 'Teh Botol',
                    price: 4000,
                    quantity: 2,
                  ),
                  CartItem(
                    imageUrl: 'assets/gojo.jpg',
                    title: 'Burger King Small',
                    price: 35000,
                    quantity: 1,
                  ),
                ],
              ),
            ),
            ShoppingSummary(),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final int quantity;

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 70, height: 70, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Rp. ${price.toString()},00', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              Text(quantity.toString(), style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ShoppingSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int tax = 10000;
    int totalPrice = 94000;
    int totalPayment = totalPrice + tax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 8),
        SummaryRow(label: 'PPN 11%', amount: tax),
        SummaryRow(label: 'Total belanja', amount: totalPrice),
        SizedBox(height: 8),
        SummaryRow(
          label: 'Total Pembayaran',
          amount: totalPayment,
          isTotal: true,
        ),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Checkout', style: TextStyle(fontSize: 16)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final int amount;
  final bool isTotal;

  SummaryRow({required this.label, required this.amount, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text('Rp. ${amount.toString()},00', style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}