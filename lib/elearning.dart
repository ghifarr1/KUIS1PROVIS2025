import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const ELearningApp());
}

class ELearningApp extends StatelessWidget {
  const ELearningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan palet warna yang diberikan
    // 1D1616, 8E1616, FFD65A, D84040, EEEEEE
    final Color darkBackground = const Color(0xFF1D1616);
    final Color primaryRed = const Color(0xFFD84040);
    final Color accentYellow = const Color(0xFFFFD65A);

    return MaterialApp(
      title: 'E-Learning Page',
      theme: ThemeData(
        scaffoldBackgroundColor: darkBackground,
        primaryColor: primaryRed,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryRed,
          secondary: accentYellow,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const ELearningPage(),
    );
  }
}

class ELearningPage extends StatefulWidget {
  const ELearningPage({Key? key}) : super(key: key);

  @override
  State<ELearningPage> createState() => _ELearningPageState();
}

class _ELearningPageState extends State<ELearningPage> {
  // List data mata kuliah
  final List<Course> courses = [
    Course(
      title: 'Analisis dan Desain Algoritma',
      sks: 3,
      schedule: '07:00 - 09:30, C-107',
      lecturer: 'Yaya Wihardi, S.Kom., M.Kom.',
      imageUrl: 'https://picsum.photos/seed/algoritma/60',
    ),
    Course(
      title: 'Sistem Operasi',
      sks: 3,
      schedule: '15:30 - 18:00, C-303',
      lecturer: 'Herbert, S.Kom., M.T.',
      imageUrl: 'https://picsum.photos/seed/sisop/60',
    ),
    Course(
      title: 'Desain Pemrograman Berbasis Objek',
      sks: 3,
      schedule: '13:00 - 15:30, C-308',
      lecturer: 'Rosa Ariani Sukamto, M.T.',
      imageUrl: 'https://picsum.photos/seed/oop/60',
    ),
    Course(
      title: 'Pemrograman Visual & Piranti Bergerak',
      sks: 3,
      schedule: '09:30 - 12:00, C-302',
      lecturer: 'Dr. Yudi Wibisono, S.T., M.T.',
      imageUrl: 'https://picsum.photos/seed/mobile/60',
    ),
    Course(
      title: 'Metodologi Penelitian',
      sks: 3,
      schedule: '09:30 - 12:00, B-205',
      lecturer: 'Rizky Rachman Judhie Putra, M.Kom.',
      imageUrl: 'https://picsum.photos/seed/metpen/60',
    ),
    Course(
      title: 'Big Data Platforms',
      sks: 2,
      schedule: '07:00 - 08:40, S-304',
      lecturer: 'Prof. Dr. Lala Septem Riza, M.T.',
      imageUrl: 'https://picsum.photos/seed/bigdata/60',
    ),
  ];

  // Hanya dua warna untuk background card: kuning & abu-abu
  final List<Color> cardColors = [
    const Color(0xFFFFD65A), // Kuning
    const Color(0xFFEEEEEE), // Abu-abu terang
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dibuat custom agar mirip dengan gambar yang dilampirkan
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: Colors.red,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
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
                  icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                ),
                const SizedBox(width: 8),
                // Teks Dashboard & Informasi Akademis
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sistem Pembelajaran Online',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                // Avatar di sisi kanan
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        // Aksi untuk avatar (profil, dsb.)
                      },
                      icon: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          // Pilih warna card berdasarkan index (selang-seling)
          final Color bgColor = cardColors[index % 2];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: InkWell(
              onTap: () {
                // Aksi ketika list ditekan (misal: buka halaman detail)
              },
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Gambar kecil di sebelah kiri
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(course.imageUrl ?? ''),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    // Informasi mata kuliah
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: bgColor == cardColors[1]
                                    ? Colors.black
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${course.sks} SKS | ${course.schedule}',
                              style: TextStyle(
                                fontSize: 13,
                                color: bgColor == cardColors[1]
                                    ? Colors.grey[800]
                                    : Colors.grey[900],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              course.lecturer,
                              style: TextStyle(
                                fontSize: 12,
                                color: bgColor == cardColors[1]
                                    ? Colors.grey[700]
                                    : Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Icon panah untuk menandakan aksi lebih lanjut
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model data untuk mata kuliah
class Course {
  final String title;
  final int sks;
  final String schedule;
  final String lecturer;
  final String? imageUrl;

  Course({
    required this.title,
    required this.sks,
    required this.schedule,
    required this.lecturer,
    this.imageUrl,
  });
}
