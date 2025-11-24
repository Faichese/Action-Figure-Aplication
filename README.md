# FigureVerse App - Project Flutter

Aplikasi toko action figure terbaik, Pelayanan cepat barang sudah pasti 100% ori.

# Biodata
  Nama  : Faisal Muhamad Rizqi   
  Nim   : 23552012015   
  Class : TIF RP 23 CID A   

# Fitur Utama:
  - Splash Screen
  - Register/Login
  - Home Screen
  - Checkout
  - Detail Items
  - Product Card

# Library
  - cupertino_icons: ^1.0.8
  - marquee: ^2.2.0 
  - shared_preferences: ^2.2.2

# Tampilan 






# Stuktru Proyek 

```FigureVerse
lib/
├── assets/
│   ├── Batman.jpg
│   ├── Gundam.jpg
│   ├── Ironman.png
│   ├── Logo_FigureVerse_biru.png
│   ├── Logo_Toko FigureVerse.png
│   ├── Luffy.jpg
│   ├── Naruto.jpg 
│   ├── Profile.jpg
│   ├── Zoro.jpg 
│   ├── ZoroW.jpg
├── data/
│   └── account_data.dart  
├── models/
│   └── action_figure.dart  # Model Data Dummy
├── screens/
│   ├── splash_screen.dart  
│   ├── auth/
│       ├── login_screen.dart    
│       └── register_screen.dart 
│   ├── about_screen.dart   
│   ├── checkout_screen.dart    
│   ├── detail_screen.dart    
│   ├── home_screen.dart    
│   ├── main_screen.dart    
│   └── splash_screen.dart  
└── widgets/
│    └── product_card.dart   # Widget custom untuk tampilan item
├── main.dart               # Entry point & Routing
└── Readme.md
