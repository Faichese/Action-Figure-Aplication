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
https://drive.google.com/open?id=1RijJA__QB15voKTPBgjHbdvYtyMDWaP_&usp=drive_copy
https://drive.google.com/open?id=1DYcx2KP_uGd0EPTOuwPJVtU4QsBCnZMM&usp=drive_copy
https://drive.google.com/open?id=1RsCl02gz46S7ercZsTtJQKjvuPimZAwI&usp=drive_copy
https://drive.google.com/open?id=1zX8wrXMmjsUxx0F6252DNRGQ_mUn-PpF&usp=drive_copy
https://drive.google.com/open?id=1hC-2n4nIarpkZ_IRzVw948Ns4TvQ1OBb&usp=drive_copy
https://drive.google.com/open?id=196N92WZDZEOUFw2_i9wFaqzSrPqND8RJ&usp=drive_copy
https://drive.google.com/open?id=1JMwyn3vdMpBVYLN5id5HaP27pke2xrBx&usp=drive_copy
https://drive.google.com/open?id=1yJ-J_aAcRInmRw5Nl9unvvqPxyIpJ_at&usp=drive_copy
https://drive.google.com/open?id=19N0TL9fyIragvHpWEatWyFbcPTw6QiSU&usp=drive_copy





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
