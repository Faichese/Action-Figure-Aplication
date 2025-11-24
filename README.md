# FigureVerse App - Project Flutter

Aplikasi toko action figure terbaik, Pelayanan cepat barang sudah pasti 100% ori.

# Biodata
  Nama  : Faisal Muhamad Rizqi   
  Nim   : 23552012015   
  Class : TIF RP 23 CID A   

# Fitur Utama
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
![Screenshot_2025-11-24-20-55-13-42](https://github.com/user-attachments/assets/f48ca063-0c97-44fd-bff6-5f13216ed825)
![Screenshot_2025-11-24-20-54-54-14](https://github.com/user-attachments/assets/9edc0eda-f3de-44cf-b0c1-0854e3f99dde)
![Screenshot_2025-11-24-20-55-31-66](https://github.com/user-attachments/assets/bb00cb2f-7b65-4726-9186-4ba91a34a691)
![Screenshot_2025-11-24-20-56-38-76](https://github.com/user-attachments/assets/62a500e1-c0f7-4eda-ae49-45571ed3bdaf)
![Screenshot_2025-11-24-20-56-50-78](https://github.com/user-attachments/assets/576638ac-c5c6-4358-ad1d-fd84dc6cc297)
![Screenshot_2025-11-24-22-20-27-59](https://github.com/user-attachments/assets/07ea35f6-03ca-47ff-b46b-c185e0d1b8b1)
![Screenshot_2025-11-24-20-57-18-45](https://github.com/user-attachments/assets/21274914-3da7-4d3c-8f96-661d21740466)
![Screenshot_2025-11-24-20-57-26-63](https://github.com/user-attachments/assets/a2f4e79a-07d3-459c-bda1-66a1804a56f9)
![Screenshot_2025-11-24-22-20-35-36](https://github.com/user-attachments/assets/06a480c9-c8a6-47ba-a510-858a1f31328f)





# Stuktruk Proyek 
```
FigureVerse/
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
