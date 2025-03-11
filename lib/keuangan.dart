import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const KeuanganApp());
}

class KeuanganApp extends StatelessWidget {
  const KeuanganApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keuangan App',
      theme: ThemeData(
        primaryColor: const Color(0xFF8E1616),
        scaffoldBackgroundColor: const Color(0xFF1D1616),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8E1616),
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const KeuanganPage(),
    );
  }
}

class KeuanganPage extends StatefulWidget {
  const KeuanganPage({Key? key}) : super(key: key);

  @override
  State<KeuanganPage> createState() => _KeuanganPageState();
}

class _KeuanganPageState extends State<KeuanganPage> {
  // Contoh data statis untuk tampilan awal
  final double totalSaldo = 1781000.00;

  // Daftar transaksi (contoh data)
  final List<Transaksi> listTransaksi = [
    Transaksi(
      jenis: 'E-Wallet',
      detail: '08**121545',
      amount: 81000.0,
      date: ' ',
      isIncome: true,
    ),
    Transaksi(
      jenis: 'Rekening ATM',
      detail: '10 Maret 2025',
      amount: 10000.0,
      date: '10 Maret 2025',
      isIncome: true,
    ),
    Transaksi(
      jenis: 'Rekening ATM',
      detail: '09 Maret 2025',
      amount: 15000.0,
      date: '09 Maret 2025',
      isIncome: true,
    ),
    Transaksi(
      jenis: 'Rekening ATM',
      detail: '07 Maret 2025',
      amount: 20000.0,
      date: '07 Maret 2025',
      isIncome: true,
    ),
    Transaksi(
      jenis: 'Rekening ATM',
      detail: '05 Maret 2025',
      amount: 25000.0,
      date: '05 Maret 2025',
      isIncome: true,
    ),
  ];

  // Index untuk menu bar (0=Tambah Dana, 1=Statistik, 2=Target, 3=Laporan)
  int selectedMenuIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Laporan Keuangan',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Abdurrahman Al Ghifari',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          // Contoh foto profil menggunakan CircleAvatar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/1.jpg',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Bagian total saldo
              Card(
                color: const Color(0xFF8E1616),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Total Saldo: Rp. ${totalSaldo.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xFFFFD65A),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Menu utama (Tambah Dana, Statistik, Target, Laporan)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuItem(
                    iconData: Icons.add,
                    label: 'Tambah Dana',
                    index: 0,
                  ),
                  _buildMenuItem(
                    iconData: Icons.show_chart,
                    label: 'Statistik',
                    index: 1,
                  ),
                  _buildMenuItem(
                    iconData: Icons.flag,
                    label: 'Target',
                    index: 2,
                  ),
                  _buildMenuItem(
                    iconData: Icons.description,
                    label: 'Laporan',
                    index: 3,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Kartu info "Kartu ATM"
              Card(
                color: const Color(0xFF8E1616),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Kartu ATM (1234658792)',
                        style: TextStyle(
                          color: Color(0xFFFFD65A),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp. 1.700.000,00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Filter pemasukan/pengeluaran (contoh saja)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedMenuIndex == 0
                            ? const Color(0xFFD84040)
                            : const Color(0xFF8E1616),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedMenuIndex == 1
                            ? const Color(0xFFD84040)
                            : const Color(0xFF8E1616),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Daftar transaksi
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listTransaksi.length,
                itemBuilder: (context, index) {
                  final trx = listTransaksi[index];
                  return Card(
                    color: const Color(0xFF1D1616),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFF525252),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          trx.isIncome
                              ? Icons.arrow_circle_down
                              : Icons.arrow_circle_up,
                          color: trx.isIncome ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(
                        '${trx.jenis} - ${trx.detail}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        trx.date,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: Text(
                        '${trx.isIncome ? '+' : '-'} Rp. ${trx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: trx.isIncome
                              ? const Color(0xFF0AA904)
                              : Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget pembangun item menu (Tambah Dana, Statistik, dll).
  Widget _buildMenuItem({
    required IconData iconData,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
        });
        // Di sini bisa diarahkan ke halaman lain atau menampilkan fitur lain
      },
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              iconData,
              color: const Color(0xFF1D1616),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// Model sederhana untuk data transaksi
class Transaksi {
  final String jenis; // E-Wallet, Rekening ATM, dsb.
  final String detail; // misal: nomor rekening, keterangan, dsb.
  final double amount;
  final String date;
  final bool isIncome; // true=pemasukan, false=pengeluaran

  Transaksi({
    required this.jenis,
    required this.detail,
    required this.amount,
    required this.date,
    required this.isIncome,
  });
}
