import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akademik Page',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1616),
      ),
      home: Scaffold(
        body: ListView(
          children: const [
            AkademikPage(),
          ],
        ),
      ),
    );
  }
}

class AkademikPage extends StatelessWidget {
  const AkademikPage({Key? key}) : super(key: key);

  // Fungsi untuk membuat box kecil dengan warna solid dan teks label
  Widget _buildSmallBox(String label) {
    return Container(
      width: 142,
      height: 121,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFEEEEEE),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ukuran layar dinamis
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenHeight,
          clipBehavior: Clip.antiAlias,
          // Background utama dengan warna solid #1D1616
          decoration: const BoxDecoration(
            color: Color(0xFF1D1616),
          ),
          child: Stack(
            children: [
              // BACK BUTTON (kiri atas) dengan warna solid #8E1616
              // Posisi top diubah menjadi 60 agar sejajar dengan tulisan dashboard.
              Positioned(
                left: 0,
                top: 60,
                child: Container(
                  width: 49,
                  height: 49,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
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
                ),
              ),
              // PROFILE ICON (kanan atas) dengan warna solid #8E1616
              Positioned(
                left: screenWidth - 98,
                top: 49,
                child: SizedBox(
                  width: 69,
                  height: 69,
                  child: IconButton(
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Aksi profil
                    },
                  ),
                ),
              ),
              // JUDUL DASHBOARD dengan jarak dari ikon back (left: 60)
              const Positioned(
                left: 60,
                top: 60,
                child: Text(
                  'Dashboard\nInformasi Akademis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // BOX PROGRAM STUDI (warna solid #FFD65A)
              Positioned(
                left: 28,
                top: 151,
                child: Container(
                  width: screenWidth - 56,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFD65A),
                  ),
                ),
              ),
              // LABEL PROGRAM STUDI
              const Positioned(
                left: 39,
                top: 161,
                child: Text(
                  'Program Studi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // VALUE: ILMU KOMPUTER
              const Positioned(
                left: 39,
                top: 185,
                child: Text(
                  'Ilmu Komputer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // VALUE: STRATA 1
              Positioned(
                left: screenWidth - 120,
                top: 173,
                child: const Text(
                  'Strata 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // BOX PEROLEHAN SKS (warna solid #FFD65A)
              Positioned(
                left: 28,
                top: 247,
                child: Container(
                  width: screenWidth - 56,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFD65A),
                  ),
                ),
              ),
              // LABEL PEROLEHAN SKS
              const Positioned(
                left: 39,
                top: 257,
                child: Text(
                  'Perolehan SKS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // SUB-LABEL SKS
              const Positioned(
                left: 40,
                top: 281,
                child: Text(
                  'Satuan Kredit Semester',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // VALUE SKS
              Positioned(
                left: screenWidth - 70,
                top: 269,
                child: const Text(
                  '63',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // BOX IPK (warna solid #FFD65A)
              Positioned(
                left: 28,
                top: 343,
                child: Container(
                  width: screenWidth - 56,
                  height: 67,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFD65A),
                  ),
                ),
              ),
              // LABEL IPK
              const Positioned(
                left: 40,
                top: 353,
                child: Text(
                  'IPK',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // SUB-LABEL IPK
              const Positioned(
                left: 39,
                top: 377,
                child: Text(
                  'Indeks Prestasi Kumulatif',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // VALUE IPK
              Positioned(
                left: screenWidth - 85,
                top: 365,
                child: const Text(
                  '3.96',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // LABEL AKTIVITAS
              const Positioned(
                left: 40,
                top: 423,
                child: Text(
                  'Aktivitas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // BOX BESAR AKTIVITAS
              Positioned(
                left: 28,
                top: 453,
                child: Container(
                  width: screenWidth - 56,
                  height: 329,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFD84040),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSmallBox('Nilai Semester'),
                            _buildSmallBox('Perwalian'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSmallBox('Transkip Nilai'),
                            _buildSmallBox('Rencana Studi'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
