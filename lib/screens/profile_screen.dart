import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  String nama = 'Niss';
  String email = 'user@gmail.com';
  String phone = '081234567890';
  String alamat =
      'Tasikmalaya, Jawa Barat';

  Future<void> editProfil() async {

    final result =
        await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const EditProfileScreen(),
      ),
    );

    if (result != null) {

      setState(() {

        nama =
            result['nama'];

        email =
            result['email'];

        phone =
            result['phone'];

        alamat =
            result['alamat'];
      });
    }
  }

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

            Text(
              nama,
              style:
                  const TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Text(
              email,
              style:
                  const TextStyle(
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

              child: ListTile(
                leading:
                    const Icon(
                  Icons.person,
                ),

                title:
                    const Text(
                  'Nama Lengkap',
                ),

                subtitle:
                    Text(
                  nama,
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

              child: ListTile(
                leading:
                    const Icon(
                  Icons.email,
                ),

                title:
                    const Text(
                  'Email',
                ),

                subtitle:
                    Text(
                  email,
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

              child: ListTile(
                leading:
                    const Icon(
                  Icons.phone,
                ),

                title:
                    const Text(
                  'Nomor HP',
                ),

                subtitle:
                    Text(
                  phone,
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

              child: ListTile(
                leading:
                    const Icon(
                  Icons.location_on,
                ),

                title:
                    const Text(
                  'Alamat',
                ),

                subtitle:
                    Text(
                  alamat,
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

              child:
                  ElevatedButton.icon(
                onPressed:
                    editProfil,

                icon:
                    const Icon(
                  Icons.edit,
                ),

                label:
                    const Text(
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

              child:
                  ElevatedButton.icon(
                onPressed: () {

                  showDialog(
                    context:
                        context,

                    builder:
                        (context) {

                      return AlertDialog(
                        title:
                            const Text(
                          'Logout',
                        ),

                        content:
                            const Text(
                          'Yakin ingin logout?',
                        ),

                        actions: [

                          TextButton(
                            onPressed:
                                () {
                              Navigator.pop(
                                  context);
                            },

                            child:
                                const Text(
                              'Batal',
                            ),
                          ),

                          ElevatedButton(
                            onPressed:
                                () {

                              Navigator.pop(
                                  context);

                              ScaffoldMessenger.of(
                                      context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text(
                                    'Fitur login belum dibuat',
                                  ),
                                ),
                              );
                            },

                            child:
                                const Text(
                              'Logout',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red,
                  foregroundColor:
                      Colors.white,
                ),

                icon:
                    const Icon(
                  Icons.logout,
                ),

                label:
                    const Text(
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