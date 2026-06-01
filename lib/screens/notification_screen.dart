import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
        ),
      ),

      body: ListView(
        children: const [

          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.shopping_bag,
              ),
            ),
            title: Text(
              'Pesanan berhasil dibuat',
            ),
            subtitle: Text(
              'Terima kasih telah berbelanja',
            ),
          ),

          Divider(),

          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.notifications,
              ),
            ),
            title: Text(
              'Selamat datang di Sukunin Delivery',
            ),
            subtitle: Text(
              'Nikmati berbagai varian keripik sukun',
            ),
          ),
        ],
      ),
    );
  }
}