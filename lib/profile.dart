import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(
    text: 'John Doe',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '08123456789',
  );
  final TextEditingController _addressController = TextEditingController(
    text: 'Bandung, Jawa Barat',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green[700],
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          SizedBox(height: 24),

          Text('Nama:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),

          SizedBox(height: 16),
          Text('Telepon:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Nomor Telepon',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),

          SizedBox(height: 16),
          Text('Alamat:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            controller: _addressController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Alamat Lengkap',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
            ),
          ),

          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Contoh aksi simpan data
                print('Nama: ${_nameController.text}');
                print('Telepon: ${_phoneController.text}');
                print('Alamat: ${_addressController.text}');
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Data tersimpan')));
              },
              child: Text('Simpan'),
            ),
          ),
        ],
      ),
    );
  }
}
