// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../models/action_figure.dart';

class DetailScreen extends StatelessWidget {
  final ActionFigure product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Gambar Produk ---
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                product.imageAsset,
                fit: BoxFit.cover,
              ),
            ),

            // --- Detail Utama ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.price,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.green[700],
                    ),
                  ),
                  const Divider(height: 30),

                  // --- Detail Keterangan Tambahan ---
                  _buildDetailRow(
                      Icons.description, 'Deskripsi', product.description),
                  _buildDetailRow(
                      Icons.date_range, 'Tanggal Rilis', product.releaseDate),
                  _buildDetailRow(Icons.star, 'Kualitas', product.quality),
                  _buildDetailRow(Icons.shopping_bag, 'Terjual',
                      '${product.soldCount} unit'),

                  const Divider(height: 30),

                  // --- Tombol Aksi (Opsional) ---
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Aksi: Kembali ke halaman utama atau langsung checkout
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Menambahkan ${product.name} ke Keranjang!')));
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Tambah ke Keranjang'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi Pembantu untuk Baris Detail
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueGrey[700], size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
