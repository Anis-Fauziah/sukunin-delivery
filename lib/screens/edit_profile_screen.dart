import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {

  final namaController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final phoneController =
      TextEditingController();

  final addressController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    namaController.text = 'Niss';
    emailController.text =
        'user@gmail.com';
    phoneController.text =
        '081234567890';
    addressController.text =
        'Tasikmalaya, Jawa Barat';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller:
                  namaController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Nama Lengkap',
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            TextField(
              controller:
                  emailController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Email',
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            TextField(
              controller:
                  phoneController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Nomor HP',
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            TextField(
              controller:
                  addressController,
              maxLines: 3,

              decoration:
                  const InputDecoration(
                labelText:
                    'Alamat',
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
                  ElevatedButton(
                onPressed: () {

  Navigator.pop(
    context,
    {
      'nama':
          namaController.text,
      'email':
          emailController.text,
      'phone':
          phoneController.text,
      'alamat':
          addressController.text,
    },
  );
},

                child:
                    const Text(
                  'Simpan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}