import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const NotifikasiApp());
}

class NotifikasiApp extends StatelessWidget {
  const NotifikasiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifikasi UI',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkRed,
          titleTextStyle: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: AppColors.lightGrey),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.lightGrey),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.darkRed,
          secondary: AppColors.yellow,
        ),
      ),
      home: const NotifikasiPage(),
    );
  }
}

class AppColors {
  static const Color darkBackground = Color(0xFF1D1616);
  static const Color darkRed = Color(0xFF8E1616);
  static const Color yellow = Color(0xFFFFD65A);
  static const Color red = Color(0xFFD84040);
  static const Color lightGrey = Color(0xFFEEEEEE);
}

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new, // Icon arrow back iOS rounded
            color: AppColors.lightGrey,
          ),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => const KuisProvisApp()),
              );
            }
          },
        ),
        title: const Text('Daftar Notifikasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationCard(
            context,
            title: 'Deadline Tugas Provis',
            subtitle: 'Tugas Provis hingga 09:30',
          ),
          _buildNotificationCard(
            context,
            title: 'Pesan Baru dari Julian',
            subtitle: 'Halo Halo Bandung',
          ),
          _buildNotificationCard(
            context,
            title: 'Deadline Tugas Provis',
            subtitle: 'Tugas Provis hingga 09:30',
          ),
          _buildNotificationCard(
            context,
            title: 'Deadline Tugas Provis',
            subtitle: 'Tugas Provis hingga 09:30',
          ),
          _buildNotificationCard(
            context,
            title: 'Deadline Tugas Provis',
            subtitle: 'Tugas Provis hingga 09:30',
          ),
        ],
      ),
    );
  }

  // Fungsi pembangun Card notifikasi statis
  Widget _buildNotificationCard(
      BuildContext context, {
        required String title,
        required String subtitle,
      }) {
    return Card(
      color: AppColors.lightGrey, // Warna background card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: const Icon(
          Icons.alarm, // Semua ikon notifikasi menggunakan ikon alarm
          color: AppColors.red,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black, // Agar kontras dengan lightGrey
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          color: AppColors.darkRed,
          onPressed: () {
            // Contoh aksi: tidak perlu diimplementasikan
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opsi untuk "$title"')),
            );
          },
        ),
      ),
    );
  }
}
