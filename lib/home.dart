import 'package:flutter/material.dart';
import 'package:rizal_flutter/pesanan.dart';
import 'package:rizal_flutter/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeContent(), // ini konten utama
    OrdersPage(), // buat halaman pesanan
    ProfilePage(), // buat halaman akun
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gojek Clone',
          style: TextStyle(
            color: Colors.white, // Warna teks merah
            fontSize: 20, // Ukuran font
            fontWeight: FontWeight.bold, // Ketebalan font
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.green[700],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  final List<Map<String, dynamic>> _menuItems = const [
    {'icon': Icons.directions_bike, 'label': 'GoRide'},
    {'icon': Icons.directions_car, 'label': 'GoCar'},
    {'icon': Icons.fastfood, 'label': 'GoFood'},
    {'icon': Icons.local_grocery_store, 'label': 'GoMart'},
    {'icon': Icons.local_shipping, 'label': 'GoSend'},
    {'icon': Icons.payment, 'label': 'GoPay'},
    {'icon': Icons.more_horiz, 'label': 'More'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Input & tombol
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    print('Tombol ditekan');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          // Banner
          Container(
            margin: EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Promo Gojek Hari Ini!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Grid Menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: NeverScrollableScrollPhysics(),
              children:
                  _menuItems.map((item) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green[50],
                          child: Icon(item['icon'], color: Colors.green[800]),
                        ),
                        SizedBox(height: 6),
                        Text(item['label'], style: TextStyle(fontSize: 12)),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
