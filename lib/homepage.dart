import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage
// Import halaman lain sesuai dengan route integrasi
import 'healthcare.dart';       // MentalHealthPage()
import 'elearning.dart';        // ELearningPage()
import 'chatting.dart';         // ChattingPage()
import 'keuangan.dart';         // KeuanganApp()
import 'medsos.dart';           // MySocialMediaApp()
import 'notifikasi.dart';       // NotifikasiPage()
import 'akademik.dart';         // AkademikPage()
import 'todolist.dart';         // MyToDoApp()

class MyImprovedApp extends StatelessWidget {
  const MyImprovedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Palet warna:
    // - 1D1616: Background utama (gelap)
    // - 8E1616: Aksen AppBar dan elemen pendukung
    // - FFD65A: Highlight utama (misalnya judul section)
    // - D84040: Aksen untuk tombol, box atau bagian tertentu
    // - EEEEEE: Background card yang terang
    final baseTheme = ThemeData(
      primaryColor: const Color(0xFFFFD65A),
      scaffoldBackgroundColor: const Color(0xFF1D1616),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF8E1616),
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Color(0xFFEEEEEE)),
        titleLarge: TextStyle(color: Color(0xFFEEEEEE)),
      ),
    );

    return MaterialApp(
      title: 'Dynamic UI Example',
      theme: baseTheme,
      // Jadikan HomePage sebagai halaman utama aplikasi
      home: const HomePage(),
    );
  }
}

// Model berita
class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  const NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data berita
  final List<NewsItem> _newsList = const [
    NewsItem(
      title: 'Beasiswa Sempurna',
      description:
          'Beasiswa untuk siswa berprestasi.\nMinimal mahasiswa semester 5.\nTap untuk rincian.',
      imageUrl:
          'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?fit=crop&w=400&q=80',
    ),
    NewsItem(
      title: 'Beasiswa Unggulan',
      description:
          'Terbuka bagi seluruh mahasiswa.\nMenyediakan bantuan dana hingga lulus.\nTap untuk rincian.',
      imageUrl:
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?fit=crop&w=400&q=80',
    ),
    NewsItem(
      title: 'Beasiswa Maju Bersama',
      description:
          'Fokus pada bidang teknologi.\nMenerima pendaftar sampai semester akhir.\nTap untuk rincian.',
      imageUrl:
          'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?fit=crop&w=400&q=80',
    ),
  ];

  int _currentNewsIndex = 0;

  // Data pengingat
  final List<Map<String, String>> _reminders = [
    {
      'title': 'Kuliah Hari ini',
      'subtitle': 'Pemrograman Visual, 09:30 C-302',
    },
    {
      'title': 'Tugas Provis',
      'subtitle': 'Hingga Besok, 10:00',
    },
    {
      'title': 'Tugas Praktikum DPBO',
      'subtitle': 'Hingga Jumat, 09:30',
    },
  ];

  int _currentIndex = 0;

  void _prevNews() {
    setState(() {
      if (_currentNewsIndex > 0) {
        _currentNewsIndex--;
      }
    });
  }

  void _nextNews() {
    setState(() {
      if (_currentNewsIndex < _newsList.length - 1) {
        _currentNewsIndex++;
      }
    });
  }

  // Mapping fitur ke route yang sesuai
  final Map<String, Widget Function()> featureRoutes = {
    'Mental Health': () => const MentalHealthApp(),
    'Akademik': () => const AkademikPage(),
    'Keuangan': () => const KeuanganApp(),
    'E-Learning': () => const ELearningApp(),
  };

  // Widget: Carousel Berita Terkini
  Widget _buildBeritaTerkiniCarousel() {
    final item = _newsList[_currentNewsIndex];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE), // Menggunakan background terang
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar berita
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF1D1616), width: 1.0),
            ),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Informasi teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D1616),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF1D1616),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Navigasi berita
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                color: _currentNewsIndex == 0 ? Colors.grey : const Color(0xFF1D1616),
                onPressed: _currentNewsIndex == 0 ? null : _prevNews,
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                color: _currentNewsIndex == _newsList.length - 1
                    ? Colors.grey
                    : const Color(0xFF1D1616),
                onPressed: _currentNewsIndex == _newsList.length - 1 ? null : _nextNews,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget: List Pengingat
  Widget _buildReminders() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFD84040).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _reminders.map((data) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: const Color(0xFFEEEEEE),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1616),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data['subtitle'] ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1D1616),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget: Grid Fitur
  Widget _buildFeatureGrid() {
    final List<Map<String, dynamic>> features = [
      {
        'icon': Icons.favorite,
        'label': 'Mental Health',
        'color': const Color(0xFF8E1616),
      },
      {
        'icon': Icons.school,
        'label': 'Akademik',
        'color': const Color(0xFFFFD65A),
      },
      {
        'icon': Icons.account_balance_wallet,
        'label': 'Keuangan',
        'color': const Color(0xFFD84040),
      },
      {
        'icon': Icons.computer,
        'label': 'E-Learning',
        'color': const Color(0xFFFFD65A),
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF8E1616).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
        children: features.map((feature) {
          return GestureDetector(
            onTap: () {
              if (featureRoutes.containsKey(feature['label'])) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => featureRoutes[feature['label']]!(),
                  ),
                );
              }
            },
            child: _buildFeatureIcon(
              icon: feature['icon'],
              label: feature['label'],
              backgroundColor: feature['color'],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget: Ikon Fitur
  Widget _buildFeatureIcon({
    required IconData icon,
    required String label,
    Color backgroundColor = Colors.grey,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white, size: 50),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      // AppBar dengan search field dan ikon profil
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF1D1616),
          ),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const KuisProvisApp()),
              );
            }
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            style: const TextStyle(color: Color(0xFFEEEEEE)),
            decoration: InputDecoration(
              hintText: 'Cari pengumuman, materi kuliah...',
              hintStyle: const TextStyle(color: Color(0xFFEEEEEE)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFFEEEEEE)),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Aksi menuju profil pengguna.
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Informasi Terkini
              Text(
                'Informasi Terkini',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFFFD65A),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              _buildBeritaTerkiniCarousel(),
              const SizedBox(height: 16),
              // Section: Pengingat
              Text(
                'Pengingat',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFFFD65A),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              _buildReminders(),
              const SizedBox(height: 16),
              // Section: Fitur
              Text(
                'Fitur',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFFFFD65A),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              _buildFeatureGrid(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        selectedItemColor: const Color(0xFFD84040),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal & ToDo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Pesan & Grup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_see),
            label: 'Media Sosial',
          ),
        ],
      ),
    );
  }
}
