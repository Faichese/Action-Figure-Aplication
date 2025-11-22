// screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Pindah ke Login setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pertahankan warna latar belakang gelap
      backgroundColor: const Color.fromARGB(255, 5, 149, 222),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar Logo
            Image.asset(
              'assets/Logo_Toko FigureVerse.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),

            // Teks Logo
            const Text("FigureVerse",
                style: TextStyle(
                    fontSize: 28, // Perbesar sedikit agar lebih menonjol
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),

            const SizedBox(height: 30),

            // --- ANIMASI LOADING ---
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.orangeAccent), // Warna loading indicator
              strokeWidth: 3,
            ),

            const SizedBox(height: 15),

            // --- KETERANGAN APLIKASI ---
            const Text(
              "Toko terbaik untuk Action Figure",
              style: TextStyle(
                  fontSize: 14,
                  color:
                      Colors.white70), // Warna agak pudar agar fokus pada logo
            ),

            const SizedBox(height: 5),

            const Text(
              "Loading assets...",
              style: TextStyle(fontSize: 12, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
