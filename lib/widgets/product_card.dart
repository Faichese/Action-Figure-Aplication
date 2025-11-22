import 'package:flutter/material.dart';
import '../models/action_figure.dart';
import '../screens/checkout_screen.dart';
import '../screens/detail_screen.dart'; // <-- IMPORT Halaman Detail

class ProductCard extends StatelessWidget {
  final ActionFigure actionFigure;
  // Properti onTap ini mungkin masih digunakan oleh GridView/ListView,
  // namun untuk tap gambar, kita akan langsung menavigasi ke DetailScreen.
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.actionFigure,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- BAGIAN GAMBAR (Diperbarui onTap untuk ke DetailScreen) ---
          Expanded(
            child: GestureDetector(
              // LOGIKA BARU: Navigasi ke DetailScreen saat gambar ditekan
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(product: actionFigure),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    actionFigure.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(Icons.broken_image,
                            color: Colors.red, size: 50)),
                  ),
                ),
              ),
            ),
          ),

          // --- BAGIAN TEKS (Nama & Harga) ---
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actionFigure.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  actionFigure.price,
                  style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ],
            ),
          ),

          // --- TOMBOL "BUY" (Tetap mengarah ke CheckoutScreen) ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Logika untuk membeli: Navigasi ke CheckoutScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CheckoutScreen(product: actionFigure),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                  label: const Text(
                    "Beli Sekarang",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 116, 173),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
