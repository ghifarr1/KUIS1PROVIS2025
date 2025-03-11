import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan warna dari palet:
    // - Scaffold: 1D1616
    // - Aksen AppBar: 8E1616
    // - Primary (Highlight): FFD65A
    // - Gradasi/Button: D84040 & FFD65A
    // - Card Background: EEEEEE
    return MaterialApp(
      title: 'Mental Health Care',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1616),
        primaryColor: const Color(0xFFFFD65A),
      ),
      home: const MentalHealthPage(),
    );
  }
}

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E1616),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
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
        title: const Text('Mental Health Care'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildGreetingSection(context),
          const SizedBox(height: 16),
          _buildMoodCardSection(context),
          const SizedBox(height: 16),
          _buildTopicsGrid(context),
          const SizedBox(height: 16),
          _buildCounselingSection(context),
        ],
      ),
    );
  }

  // Bagian Greeting dengan tampilan profil menggunakan gradasi
  Widget _buildGreetingSection(BuildContext context) {
    return Row(
      children: [
        // Menggunakan Container berbentuk lingkaran dengan gradasi sebagai pengganti gambar profil
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFD84040), Color(0xFFFFD65A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Icon(Icons.person, color: Color(0xFFEEEEEE), size: 30),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            'Halo, Abdurrahman Al Ghifari',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: const Color(0xFFFFD65A)),
          ),
        ),
      ],
    );
  }

  // Kartu Mood dengan background gradasi dan informasi teks
  Widget _buildMoodCardSection(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFEEEEEE), // Latar card yang terang
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Menggunakan Container dengan gradasi sebagai placeholder gambar mood
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFD65A), Color(0xFFD84040)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bagaimana perasaanmu hari ini?',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF1D1616),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dapatkan layanan kesehatan mental yang membantu kesejahteraan emosionalmu.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: const Color(0xFF1D1616)),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan aksi sesuai kebutuhan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E1616),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Mulai Sekarang',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Grid topik layanan dengan warna latar dan gradasi untuk tampilan yang menarik
  Widget _buildTopicsGrid(BuildContext context) {
    // Data topik dengan tipe Map<String, dynamic>
    final List<Map<String, dynamic>> topics = [
      {'title': 'Meditasi', 'color': const Color(0xFFD84040)},
      {'title': 'Yoga', 'color': const Color(0xFFFFD65A)},
      {'title': 'Terapi', 'color': const Color(0xFF8E1616)},
      {'title': 'Relaksasi', 'color': const Color(0xFFEEEEEE)},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final topic = topics[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // Untuk tampilan gradasi, gunakan gradasi di topik tertentu
              gradient: index % 2 == 0
                  ? const LinearGradient(
                colors: [Color(0xFFFFD65A), Color(0xFFD84040)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  : null,
              color: index % 2 != 0 ? topic['color'] as Color : null,
            ),
            child: Center(
              child: Text(
                topic['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D1616),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Bagian informasi layanan konseling dengan tampilan warna latar terang dan aksen
  Widget _buildCounselingSection(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFEEEEEE),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Layanan Konseling',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: const Color(0xFF1D1616), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Akses layanan konseling melalui tautan berikut:',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: const Color(0xFF1D1616)),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Tambahkan aksi membuka URL dengan package url_launcher
              },
              child: Text(
                'https://cdc.upi.edu/layanan',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Divider(height: 20, color: Color(0xFF1D1616)),
            Text(
              'Alamat:',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color(0xFF1D1616), fontWeight: FontWeight.bold),
            ),
            const Text(
              'CDC UPI, Gedung University Centre\nKampus UPI Bumi Siliwangi\nJl. Dr. Setiabudhi No. 229 Bandung, Jawa Barat - Indonesia, 40154',
              style: TextStyle(fontSize: 12, color: Color(0xFF1D1616)),
            ),
            const SizedBox(height: 8),
            Text(
              'Kontak:',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D1616)),
            ),
            const Text(
              '+62 813-2026-9955\nbadanbkpk@upi.edu',
              style: TextStyle(fontSize: 12, color: Color(0xFF1D1616)),
            ),
          ],
        ),
      ),
    );
  }
}
