import 'package:flutter/material.dart';
import '../main_screen.dart';
import 'register_screen.dart';
import '../../data/account_data.dart'; // <-- Pastikan path ini benar!

// Kelas utama LoginScreen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil nilai dari TextFormField
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Konstanta Warna untuk tampilan yang bersih
  static const Color _backgroundColor = Color.fromARGB(255, 44, 188, 255);
  static const Color _accentColor = Colors.deepOrange;

  // --- LOGIKA LOGIN DENGAN PERSISTENSI (ASYNC) ---
  void _performLogin() async {
    // 1. Validasi Input (Pastikan form terisi)
    if (_formKey.currentState!.validate()) {
      final String inputEmail = _emailController.text;
      final String inputPassword = _passwordController.text;

      final UserAccount? storedAccount = await getRegisteredAccount();

      // Cek apakah ada akun yang terdaftar DAN input pengguna cocok
      if (storedAccount != null &&
          storedAccount.email == inputEmail &&
          storedAccount.password == inputPassword) {
        // 2. Jika Berhasil
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Login Berhasil! Selamat datang, ${storedAccount.name}.'),
            backgroundColor: Colors.green,
          ),
        );

        // Navigasi ke MainScreen setelah sukses
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
      // 3. Jika Gagal
      else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Login Gagal. Email atau Password salah, atau akun belum terdaftar.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // --- FUNGSI BARU: LUPA PASSWORD (Hanya Notifikasi) ---
  void _showDevelopmentNotification() {
    // Tampilkan notifikasi sederhana
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur Lupa Password masih dalam tahap pengembangan!'),
        backgroundColor: Colors.blueGrey,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    // Pastikan controller dibuang
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // --- WIDGET PENDUKUNG (Refaktor untuk Keterbacaan) ---

  // Widget untuk Logo dan Teks Selamat Datang
  Widget _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 50),
        // 1. Logo Aplikasi
        Image.asset(
          'assets/Logo_Toko FigureVerse.png',
          height: 120,
        ),
        const SizedBox(height: 30),
        // 2. Teks Selamat Datang
        const Text(
          "Welcome Back To FigureVerse!",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  // Helper untuk dekorasi input yang konsisten
  InputDecoration _getInputDecoration({required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black54),
      floatingLabelStyle:
          const TextStyle(color: _accentColor, fontWeight: FontWeight.bold),
    );
  }

  // Widget untuk Form Input (Email, Password) dan Tombol Login
  Widget _buildLoginForm() {
    return Form(
      key: _formKey, // GlobalKey diletakkan di sini
      child: Column(
        children: [
          // 3. Input Email
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: _getInputDecoration(labelText: "Email"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          // 4. Input Password
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: _getInputDecoration(labelText: "Password"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          // Link Lupa Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _showDevelopmentNotification,
              child: const Text(
                "Lupa Password?",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // 5. Tombol Login
          ElevatedButton(
            onPressed: _performLogin,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: _accentColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("LOGIN", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  // Widget untuk Link Register
  Widget _buildRegisterLink() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      child: const Text(
        "Belum punya akun? Register",
        style: TextStyle(
            color: Color.fromARGB(
                255, 40, 31, 31)), // Ubah warna teks agar terlihat
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(), // Menampilkan Logo & Teks Selamat Datang
              _buildLoginForm(), // Menampilkan Form Input & Tombol Login
              _buildRegisterLink(), // Menampilkan Link Register
            ],
          ),
        ),
      ),
    );
  }
}
