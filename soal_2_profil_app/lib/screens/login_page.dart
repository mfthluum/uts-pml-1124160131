
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  // User dan pw dibuat disini
  static const String usernameBenar = 'ulum';
  static const String passwordBenar = '123456';

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

   
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username == usernameBenar &&
        password == passwordBenar) {

      Navigator.pushReplacementNamed(context, '/profile');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau password salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 90,
                  color: Colors.green,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Silakan login untuk melihat profil mahasiswa.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 35),

                // Input Username
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username wajib diisi';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Input Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // Tombol Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Aplikasi Profil Mahasiswa',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
