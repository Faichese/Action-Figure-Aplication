// lib/models/action_figure.dart

class ActionFigure {
  final String name;
  final String price;
  final String imageAsset; // Path gambar di folder assets
  final String description;

  // --- PROPERTI BARU ---
  final String releaseDate; // Tanggal Rilis (Simulasi)
  final String quality; // Kualitas (Contoh: HQ, Bootleg, Original)
  final int soldCount; // Jumlah Terjual (Simulasi)

  // Perbaikan: Hapus 'super.key' karena ActionFigure bukan Widget
  const ActionFigure({
    required this.name,
    required this.price,
    required this.imageAsset,
    required this.description,
    // --- REQUIRED PROPERTI BARU ---
    required this.releaseDate,
    required this.quality,
    required this.soldCount,
  });

  // Data Dummy (Static List) yang digunakan di home_screen.dart
  static const List<ActionFigure> dummyData = [
    ActionFigure(
      name: "Iron Man MK85",
      price: "Rp 4.500.000",
      imageAsset: "assets/Ironman.png",
      description: "Armor Iron Man terakhir di Endgame dengan Nano Tech.",
      releaseDate: "2020-05-15", // Data Baru
      quality: "Original - Hot Toys", // Data Baru
      soldCount: 450, // Data Baru
    ),
    ActionFigure(
      name: "Gundam RX-78-2",
      price: "Rp 850.000",
      imageAsset: "assets/Gundam.jpg",
      description: "Model kit klasik High Grade Universal Century.",
      releaseDate: "2021-01-20",
      quality: "Original - Bandai HG",
      soldCount: 1200,
    ),
    ActionFigure(
      name: "Naruto Sage Mode",
      price: "Rp 600.000",
      imageAsset: "assets/Naruto.jpg",
      description: "Figure Naruto saat melawan Pain dengan mode Sage.",
      releaseDate: "2022-11-01",
      quality: "Bootleg - Kw Grade A",
      soldCount: 850,
    ),
    ActionFigure(
      name: "Batman Hush",
      price: "Rp 1.200.000",
      imageAsset: "assets/Batman.jpg",
      description: "Action figure Batman versi komik Hush mafex.",
      releaseDate: "2023-04-10",
      quality: "Original - Mafex",
      soldCount: 320,
    ),
    ActionFigure(
      name: "Luffy Gear 5",
      price: "Rp 950.000",
      imageAsset: "assets/Luffy.jpg",
      description: "Sun God Nika bentuk terkuat Luffy.",
      releaseDate: "2024-03-25",
      quality: "Original - P.O.P",
      soldCount: 980,
    ),
    ActionFigure(
      name: "Zoro Wano Arc",
      price: "Rp 780.000",
      imageAsset: "assets/ZoroW.jpg",
      description: "Roronoa Zoro dengan kostum Wano Kuni.",
      releaseDate: "2023-08-18",
      quality: "Bootleg - Kw Grade B",
      soldCount: 610,
    ),
  ];
}
