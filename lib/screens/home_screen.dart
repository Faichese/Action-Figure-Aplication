// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../models/action_figure.dart';
import '../widgets/product_card.dart';
import 'auth/login_screen.dart'; // Pastikan path ini benar

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20), // Durasi animasi teks
      vsync: this,
    )..repeat(); // Mengulang animasi terus menerus

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Mulai dari kanan luar
      end: const Offset(-1.0, 0.0), // Berakhir di kiri luar
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // --- FUNGSI LOGOUT ---
  void _handleLogout() {
    Navigator.pop(context); // Tutup Drawer dulu

    // Tampilkan konfirmasi dialog sebelum logout
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Keluar"),
          content: const Text("Apakah Anda yakin ingin keluar dari akun ini?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Tutup dialog
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                // Tutup dialog
                Navigator.of(context).pop();

                // Tampilkan SnackBar sukses
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Anda telah berhasil keluar.'),
                    backgroundColor: Colors.redAccent,
                    duration: Duration(seconds: 1)));

                // Navigasi ke LoginScreen dan menghapus semua rute sebelumnya
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Keluar", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // --- FUNGSI MENU DUMMY LAINNYA ---

  void _showFeatureComingSoon(String featureName) {
    Navigator.pop(context); // Tutup Drawer
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$featureName sedang dikembangkan! 🚧'),
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.orange,
      ),
    );
  }

  // ------------------------------------

  @override
  Widget build(BuildContext context) {
    const List<ActionFigure> data = ActionFigure.dummyData;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: const Text(
          "FigureVerse Catalog",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            const Color.fromARGB(255, 1, 116, 173), // Tetap gelap untuk AppBar
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Keranjang Belanja')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil Pengguna')));
            },
          ),
        ],
      ),

      // --- DRAWER (SIDE BAR) YANG DIIMPLEMENTASIKAN ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header Drawer (User Accounts atau Info App)
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 116, 173),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'FigureVerse Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Katalog Figure Terbaik',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Item: Beranda (Hanya menutup Drawer)
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Item: Kategori (Simulasi fungsional)
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Kategori'),
              onTap: () => _showFeatureComingSoon('Kategori'),
            ),

            // Item: Wishlist (Simulasi fungsional)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Wishlist'),
              onTap: () => _showFeatureComingSoon('Wishlist'),
            ),

            const Divider(), // Garis pemisah

            // Item: Pengaturan (Simulasi fungsional)
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () => _showFeatureComingSoon('Pengaturan'),
            ),

            // Item: Keluar (Logout Fungsional)
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: _handleLogout, // Panggil fungsi logout
            ),
          ],
        ),
      ),
      // --- AKHIR DRAWER ---

      body: Column(
        children: [
          // --- Animasi Teks Bergerak ---
          Container(
            height: 40, // Tinggi container animasi
            color: Colors.blueGrey[700], // Background untuk teks berjalan
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SlideTransition(
                  position: _animation,
                  child: const Text(
                    "Selamat datang di FigureVerse! Barang Ori dan harga sudah termasuk Pajak. Pengiriman cepat!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),

          // Jarak antara animasi teks dan grid
          const SizedBox(height: 10),

          // --- Grid View Produk ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    actionFigure: data[index],
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Kamu memilih: ${data[index].name}"),
                          duration: const Duration(milliseconds: 500)));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
