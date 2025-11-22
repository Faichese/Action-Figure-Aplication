// lib/screens/checkout_screen.dart
import 'package:flutter/material.dart';
import '../models/action_figure.dart';

// Diubah menjadi StatefulWidget untuk mengelola state (pilihan)
class CheckoutScreen extends StatefulWidget {
  final ActionFigure product;

  const CheckoutScreen({super.key, required this.product});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Simulasi Biaya dan Pajak
  final double shippingFee = 25000;
  final double taxRate = 0.10; // 10%

  // --- NEW STATE VARIABLES ---
  String _selectedPaymentMethod = 'Bank Transfer'; // Default
  String _selectedDeliveryLocation = 'Jakarta Pusat, DKI Jakarta'; // Default
  // -------------------------

  // Daftar Metode Pembayaran
  final List<String> _paymentMethods = [
    'Bank Transfer',
    'E-Wallet (OVO/Gopay/Dana)',
    'QRIS',
    'Credit Card',
  ];

  // Daftar Lokasi Pengiriman
  final List<String> _deliveryLocations = [
    'Jakarta Pusat, DKI Jakarta',
    'Bandung, Jawa Barat',
    'Surabaya, Jawa Timur',
    'Medan, Sumatera Utara',
  ];

  // Fungsi untuk mengonversi harga string ke double
  double _calculateBasePrice() {
    double basePrice = 0.0;
    try {
      // Akses widget.product karena kita ada di State
      String cleanPrice = widget.product.price
          .replaceAll('Rp ', '')
          .replaceAll('.', '')
          .replaceAll(',', '.')
          .trim();
      basePrice = double.tryParse(cleanPrice) ?? 0.0;
    } catch (e) {
      basePrice = 0.0;
    }
    return basePrice;
  }

  // Fungsi untuk memformat harga kembali ke string Rupiah (untuk tampilan)
  String _formatPrice(double price) {
    // Menggunakan Intl package lebih baik, tapi untuk simulasi, kita pakai cara sederhana.
    // Menghilangkan desimal jika harga adalah mata uang bulat
    String priceString = price.toStringAsFixed(0);
    return 'Rp ${priceString.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    final double basePrice = _calculateBasePrice();
    final double taxAmount = basePrice * taxRate;
    final double subtotal = basePrice + taxAmount + shippingFee;

    // Tampilan Tanggal Pembelian (Saat ini)
    final String purchaseDate = DateTime.now().toString().substring(0, 10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Detail'),
        backgroundColor: const Color.fromARGB(255, 2, 159, 237),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Detail Produk (Tidak Berubah) ---
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // Akses widget.product.name
                      'Produk: ${widget.product.name}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      // Akses widget.product.imageAsset
                      widget.product.imageAsset,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    _buildRow(
                        'Harga Satuan', widget.product.price, Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Pilihan Lokasi Pengiriman ---
            _buildSelectionCard(
              title: '📍 Lokasi Pengiriman',
              selectedValue: _selectedDeliveryLocation,
              items: _deliveryLocations,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDeliveryLocation = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // --- Pilihan Metode Pembayaran  ---
            _buildSelectionCard(
              title: '💳 Metode Pembayaran',
              selectedValue: _selectedPaymentMethod,
              items: _paymentMethods,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // --- Rincian Pembayaran ---
            const Text(
              'Rincian Pembayaran',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            const Divider(),
            _buildRow('Tanggal Pembelian', purchaseDate, Colors.grey),
            // Menampilkan pilihan lokasi
            _buildRow('Dikirim ke', _selectedDeliveryLocation, Colors.blueGrey),
            // Menampilkan pilihan metode pembayaran
            _buildRow(
                'Metode Pembayaran', _selectedPaymentMethod, Colors.blueGrey),

            const SizedBox(height: 10),

            _buildRow(
                'Biaya Pengiriman', _formatPrice(shippingFee), Colors.blue),
            _buildRow('Pajak (10%)', _formatPrice(taxAmount), Colors.red),

            const Divider(thickness: 2),

            // --- Total Harga ---
            _buildRow(
                'TOTAL HARGA', _formatPrice(subtotal), Colors.green.shade700,
                isTotal: true),

            const SizedBox(height: 30),

            // --- Tombol Konfirmasi ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Pembelian Berhasil Dikonfirmasi!\nMetode: $_selectedPaymentMethod\nLokasi: $_selectedDeliveryLocation')));
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Konfirmasi & Bayar',
                    style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk baris rincian (Diubah menjadi private _buildRow)
  Widget _buildRow(String label, String value, Color color,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 15,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 20 : 15,
              fontWeight: isTotal ? FontWeight.w900 : FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu baru untuk pemilihan Dropdown
  Widget _buildSelectionCard({
    required String title,
    required String selectedValue,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              initialValue: selectedValue,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 4,
              style: const TextStyle(
                  color: Color.fromARGB(255, 1, 144, 234), fontSize: 16),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
