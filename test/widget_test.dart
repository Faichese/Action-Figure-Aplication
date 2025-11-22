import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_figure_aplication/main.dart'; // Pastikan package ini sesuai nama project kamu

void main() {
  testWidgets('App should start with Splash Screen', (
    WidgetTester tester,
  ) async {
    // 1. Jalankan aplikasi (MyApp)
    await tester.pumpWidget(const MyApp());

    // 2. Cek apakah widget Splash Screen muncul
    // Kita mencari teks "FigureVerse" yang ada di Splash Screen kamu
    expect(find.text('FigureVerse'), findsOneWidget);

    // Atau kita bisa mencari Icon Toys yang ada di splash screen
    expect(find.byIcon(Icons.toys), findsOneWidget);

    // 3. Memastikan TIDAK ADA angka '0' (karena ini bukan aplikasi counter lagi)
    expect(find.text('0'), findsNothing);
  });
}
