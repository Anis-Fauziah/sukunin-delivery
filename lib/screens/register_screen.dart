import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final TextEditingController
      fullnameController =
      TextEditingController();

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  final TextEditingController
      confirmPasswordController =
      TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
            const Text(
          'Daftar Akun',
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  fullnameController,

              decoration:
                  const InputDecoration(
                labelText:
                    'Nama Lengkap',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  emailController,

              decoration:
                  const InputDecoration(
                labelText:
                    'Email',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  passwordController,

              obscureText:
                  hidePassword,

              decoration:
                  InputDecoration(
                labelText:
                    'Password',

                border:
                    const OutlineInputBorder(),

                suffixIcon:
                    IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),

                  onPressed: () {
                    setState(() {
                      hidePassword =
                          !hidePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  confirmPasswordController,

              obscureText:
                  hideConfirmPassword,

              decoration:
                  InputDecoration(
                labelText:
                    'Konfirmasi Password',

                border:
                    const OutlineInputBorder(),

                suffixIcon:
                    IconButton(
                  icon: Icon(
                    hideConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),

                  onPressed: () {
                    setState(() {
                      hideConfirmPassword =
                          !hideConfirmPassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width:
                  double.infinity,

              child:
                  ElevatedButton(
                onPressed: () {},

                child:
                    const Text(
                  'Daftar',
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },

              child: const Text(
                'Sudah punya akun? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}