// lib/data/account_data.dart
import 'package:shared_preferences/shared_preferences.dart';

// --- Definisi Kelas ---

class UserAccount {
  final String email;
  final String
      password; // CATATAN: Menyimpan password dalam plaintext di local storage TIDAK AMAN
  final String name;

  UserAccount(
      {required this.email, required this.password, required this.name});

  // Helper untuk mengubah objek menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }

  // Helper untuk membuat objek dari Map<String, dynamic>
  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
    );
  }
}

// --- Kunci Penyimpanan ---
// Kita gunakan kunci unik untuk setiap data di SharedPreferences
const String _kEmailKey = 'account_email';
const String _kPasswordKey = 'account_password';
const String _kNameKey = 'account_name';

// --- Fungsi Penyimpanan (Register) ---

// Fungsi ini sekarang bersifat async karena mengakses SharedPreferences
Future<void> registerNewAccount(
    String email, String password, String name) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Simpan setiap field secara terpisah
  await prefs.setString(_kEmailKey, email);
  await prefs.setString(_kPasswordKey, password);
  await prefs.setString(_kNameKey, name);

  // ignore: avoid_print
  print('Akun baru terdaftar dan disimpan: Email=$email');
}

// --- Fungsi Pengambilan Data (Login/Pengecekan) ---

// Fungsi ini untuk mengambil data akun yang tersimpan
// Akan mengembalikan UserAccount jika ada, atau null jika tidak ada.
Future<UserAccount?> getRegisteredAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? email = prefs.getString(_kEmailKey);
  final String? password = prefs.getString(_kPasswordKey);
  final String? name = prefs.getString(_kNameKey);

  // Cek apakah semua data kunci ada
  if (email != null && password != null && name != null) {
    // ignore: avoid_print
    print('Akun ditemukan di penyimpanan lokal.');
    return UserAccount(email: email, password: password, name: name);
  } else {
    // ignore: avoid_print
    print('Tidak ada akun yang tersimpan di penyimpanan lokal.');
    return null; // Tidak ada akun yang terdaftar
  }
}

// --- Fungsi Opsional (Logout/Hapus Akun) ---

Future<void> deleteRegisteredAccount() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(_kEmailKey);
  await prefs.remove(_kPasswordKey);
  await prefs.remove(_kNameKey);
  // ignore: avoid_print
  print('Akun berhasil dihapus dari penyimpanan lokal.');
}
