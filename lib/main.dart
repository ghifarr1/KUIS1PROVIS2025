import 'package:flutter/material.dart';
import 'homepage.dart';
import 'healthcare.dart';
import 'elearning.dart';
import 'chatting.dart';
import 'keuangan.dart';
import 'medsos.dart';
import 'notifikasi.dart';
import 'akademik.dart';
import 'todolist.dart';

// Palet warna yang diberikan
const Color kPrimaryDark = Color(0xFF1D1616);   // Background gelap
const Color kAccentColor = Color(0xFFD84040);     // Merah untuk AppBar background
const Color kHighlightColor = Color(0xFFFFD65A);  // Kuning
const Color kBackgroundLight = Color(0xFFEEEEEE);

void main() {
  runApp(const KuisProvisApp());
}

class KuisProvisApp extends StatelessWidget {
  const KuisProvisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis 1 Provis',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: kAccentColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const KuisMainPage(),
    );
  }
}

class KuisMainPage extends StatelessWidget {
  const KuisMainPage({Key? key}) : super(key: key);

  // Perhatikan: kita harus memastikan setiap "screen" yang dipanggil
  // adalah widget _halaman_ saja, bukan instance MaterialApp.
  // Misalnya, gunakan HomePageScreen() (yang didefinisikan di homepage.dart)
  // daripada MyImprovedApp().
  final List<Map<String, dynamic>> menuItems = const [
    {
      'title': 'Homepage',
      'icon': Icons.home,
      'screen': MyImprovedApp(), // Gunakan widget screen, bukan MaterialApp
    },
    {
      'title': 'Mental Health',
      'icon': Icons.health_and_safety,
      'screen': MentalHealthPage(),
    },
    {
      'title': 'Akademik',
      'icon': Icons.school,
      'screen': AkademikPage(),
    },
    {
      'title': 'Media Sosial',
      'icon': Icons.people,
      'screen': MySocialMediaApp(), // Pastikan MySocialMediaApp() juga hanya mengekspor halaman, bukan lagi MaterialApp jika memungkinkan
    },
    {
      'title': 'E-Learning',
      'icon': Icons.computer,
      'screen': ELearningPage(),
    },
    {
      'title': 'Chatting',
      'icon': Icons.chat,
      'screen': ChattingPage(),
    },
    {
      'title': 'To-Do',
      'icon': Icons.check_circle,
      'screen': MyToDoApp(),
    },
    {
      'title': 'Notifikasi',
      'icon': Icons.notifications,
      'screen': NotifikasiPage(),
    },
    {
      'title': 'Keuangan',
      'icon': Icons.account_balance_wallet,
      'screen': KeuanganApp(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu di Kuis 1 Provis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Subjudul dengan teks "by Julian Dwi Satrio & Abdurrahman Al ghifari" berwarna kuning
            Text(
              'by Julian Dwi Satrio & Abdurrahman Al ghifari',
              style: TextStyle(
                color: kHighlightColor,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            // List menu
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        item['icon'],
                        color: Colors.black,
                      ),
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => item['screen'],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
