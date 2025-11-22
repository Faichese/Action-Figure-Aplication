// lib/screens/about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key}); // Tambahkan const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background cerah (Biru Muda)
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text("About FigureVerse"), // Tambahkan const
        // Pertahankan warna AppBar gelap agar kontras
        backgroundColor: const Color.fromARGB(255, 1, 125, 188),
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView jika konten terlalu panjang
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- FOTO PROFIL (Menggunakan Asset Lokal) ---
              CircleAvatar(
                radius: 60,
                // Menggunakan AssetImage
                backgroundImage: const AssetImage('assets/Profile.png'),
                backgroundColor: const Color.fromARGB(255, 2, 200, 218),
                child:
                    Container(), // Child kosong untuk menghilangkan peringatan
              ),

              const SizedBox(height: 40),

              // --- JUDUL DAN VERSI ---
              const Text(
                "FigureVerse v1.0",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // --- DESKRIPSI APLIKASI ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "FigureVerse adalah platform terlengkap untuk koleksi action figure original. Kami menyediakan katalog produk dari berbagai franchise seperti Marvel, DC, Gundam, dan Anime, dengan fokus pada keaslian dan harga yang transparan (sudah termasuk pajak).",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(134, 12, 17, 18), fontSize: 14),
                ),
              ),

              const SizedBox(height: 30),

              // --- KETERANGAN DEVELOPER ---
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.code),
                  title: Text("Dikembangkan oleh:"),
                  subtitle:
                      Text("Faisal Muhamad Rizqi - 23552012015 / Developer"),
                ),
              ),

              const SizedBox(height: 10),

              const Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Kontak Kami:"),
                  subtitle: Text("support@figureverse.com"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
