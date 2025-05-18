import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Map<String, dynamic>> orders = [
    {
      'no': 1,
      'nama': 'John Doe',
      'jarak': 20,
      'kota': 'Bandung',
      'order': 'Nasi Goreng',
    },
    {
      'no': 2,
      'nama': 'Sari',
      'jarak': 22,
      'kota': 'Jakarta',
      'order': 'Mie Goreng',
    },
    {
      'no': 3,
      'nama': 'Dewi',
      'jarak': 19,
      'kota': 'Surabaya',
      'order': 'Ayam Goreng',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children:
            orders.map((order) {
              return SizedBox(
                width: double.infinity, // agar card full horizontal
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No: ${order['no']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('Nama: ${order['nama']}'),
                        Text('Jarak: ${order['jarak']} Km'),
                        Text('Order: ${order['order']}'),
                        Text('Kota: ${order['kota']}'),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
