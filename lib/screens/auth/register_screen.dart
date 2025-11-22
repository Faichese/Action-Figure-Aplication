// lib/screens/auth/register_screen.dart
import 'package:flutter/material.dart';
import '../../data/account_data.dart'; // Pastikan path ini benar: lib/data/account_data.dart

// UBAH DARI StatelessWidget menjadi StatefulWidget
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _performRegistration() {
    // 1. Validasi Input Form
    if (_formKey.currentState!.validate()) {
      // 2. Pastikan Password Cocok
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Pendaftaran Gagal: Konfirmasi password tidak cocok!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // --- LANGKAH PENTING: SIMPAN DATA KE VARIABEL GLOBAL ---
      // Panggil fungsi global untuk menyimpan akun baru
      registerNewAccount(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );

      // 3. Notifikasi Sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Pendaftaran Berhasil! Silakan Login menggunakan akun yang baru dibuat.'),
          backgroundColor: Colors.green,
        ),
      );

      // 4. Kembali ke Halaman Login
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 16, 162, 230), // Background cerah
      appBar: AppBar(
        title: const Text("Register Account"),
        backgroundColor: const Color.fromARGB(255, 20, 26, 199),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Buat Akun FigureVerse Baru",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // --- Input Nama ---
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration(labelText: "Nama Lengkap"),
                validator: (value) => value == null || value.isEmpty
                    ? 'Nama tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 20),

              // --- Input Email ---
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration(labelText: "Email"),
                validator: (value) => value == null || !value.contains('@')
                    ? 'Masukkan Email yang valid'
                    : null,
              ),
              const SizedBox(height: 20),

              // --- Input Password ---
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _inputDecoration(labelText: "Password"),
                validator: (value) => value == null || value.length < 6
                    ? 'Password minimal 6 karakter'
                    : null,
              ),
              const SizedBox(height: 20),

              // --- Konfirmasi Password ---
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: _inputDecoration(labelText: "Konfirmasi Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // --- Tombol Register ---
              ElevatedButton(
                onPressed: _performRegistration,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("REGISTER", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),

              // Tombol Kembali ke Login
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Sudah punya akun? Login",
                  style: TextStyle(color: Color.fromARGB(255, 36, 46, 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi Pembantu untuk Dekorasi Input
  InputDecoration _inputDecoration({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
