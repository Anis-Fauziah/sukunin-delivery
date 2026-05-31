import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sukunin Delivery',
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 40),

            Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              'Login',
              style: TextStyle(
                fontSize: 28,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller:
                  emailController,

              decoration:
                  const InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  passwordController,

              obscureText:
                  isPasswordHidden,

              decoration:
                  InputDecoration(
                labelText:
                    'Password',

                border:
                    const OutlineInputBorder(),

                suffixIcon:
                    IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),

                  onPressed: () {
                    setState(() {
                      isPasswordHidden =
                          !isPasswordHidden;
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
                  'Login',
                ),
              ),
            ),

            TextButton(
              onPressed: () {},

              child: const Text(
                'Belum punya akun? Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}