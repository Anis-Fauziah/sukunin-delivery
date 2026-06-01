import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F6F8),

      appBar: AppBar(
        title: const Text(
          'Profil Saya',
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            const SizedBox(
              height: 20,
            ),

            const CircleAvatar(
              radius: 50,
              backgroundColor:
                  Colors.green,

              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            const Text(
              'Niss',
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            const Text(
              'user@gmail.com',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),

              child: const ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: Text(
                  'Nama Lengkap',
                ),
                subtitle: Text(
                  'Niss',
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),

              child: const ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text(
                  'Email',
                ),
                subtitle: Text(
                  'user@gmail.com',
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),

              child: const ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text(
                  'Nomor HP',
                ),
                subtitle: Text(
                  '081234567890',
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),

              child: const ListTile(
                leading: Icon(
                  Icons.location_on,
                ),
                title: Text(
                  'Alamat',
                ),
                subtitle: Text(
                  'Tasikmalaya, Jawa Barat',
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            SizedBox(
              width:
                  double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.edit,
                ),

                label: const Text(
                  'Edit Profil',
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              width:
                  double.infinity,
              height: 50,

              child: ElevatedButton.icon(
                onPressed: () {

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fitur logout akan dibuat setelah login selesai',
                      ),
                    ),
                  );
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red,
                  foregroundColor:
                      Colors.white,
                ),

                icon: const Icon(
                  Icons.logout,
                ),

                label: const Text(
                  'Logout',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}