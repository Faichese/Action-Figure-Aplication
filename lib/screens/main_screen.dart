// screens/main_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'about_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [const HomeScreen(), const AboutScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
