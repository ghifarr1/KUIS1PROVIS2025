import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Warna dari palet
    const Color redColor = Color(0xFFD84040);
    const Color yellowColor = Color(0xFFFFD65A);
    const Color backgroundBrown = Color(0xFF1D1616);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat List App',
      theme: ThemeData(
        // Background halaman menggunakan warna coklat (1D1616)
        scaffoldBackgroundColor: backgroundBrown,
        primaryColor: redColor,
        appBarTheme: AppBarTheme(
          backgroundColor: redColor,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: const TextStyle(
            color: yellowColor, // "Halo, Julian" tetap kuning
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const ChattingPage(),
    );
  }
}

// Model data untuk Chat
class ChatData {
  final String name;
  final String nim;
  final String lastMessage;
  final String time;
  final String imageUrl; // avatar
  final bool isDosen; // Menandai chat dosen/teman

  ChatData({
    required this.name,
    required this.nim,
    required this.lastMessage,
    required this.time,
    required this.imageUrl,
    required this.isDosen,
  });
}

class ChattingPage extends StatefulWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Data contoh
  final List<ChatData> allChats = [
    ChatData(
      name: 'Julian Dwi Satrio',
      nim: '2300484',
      lastMessage: 'Besok Matkul apa?',
      time: '19:30',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
      isDosen: false,
    ),
    ChatData(
      name: 'Abdurrahman Al Ghifari',
      nim: '2300456',
      lastMessage: 'Tugas ini udah belum?',
      time: '18:00',
      imageUrl: 'https://i.pravatar.cc/150?img=2',
      isDosen: false,
    ),
    ChatData(
      name: 'Ahmad Izzuddin',
      nim: '2300492',
      lastMessage: 'Kerja Kelompok yuk besok',
      time: '17:47',
      imageUrl: 'https://i.pravatar.cc/150?img=3',
      isDosen: false,
    ),
    ChatData(
      name: 'Yaya Wihardi',
      nim: '2300999',
      lastMessage: 'Pak besok kelas pengen online ya :)',
      time: '15:43',
      imageUrl: 'https://i.pravatar.cc/150?img=4',
      isDosen: true,
    ),
    ChatData(
      name: 'Rosa Ariani',
      nim: '2301000',
      lastMessage: 'Ibu izin meminta materi tadi',
      time: '15:30',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
      isDosen: true,
    ),
    ChatData(
      name: 'Muhammad Igin',
      nim: '2301455',
      lastMessage: 'Bagi ppt dong gin',
      time: '15:00',
      imageUrl: 'https://i.pravatar.cc/150?img=6',
      isDosen: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // Memfilter chat sesuai tab
  List<ChatData> getChatsForTab(int index) {
    switch (index) {
      case 0:
        return allChats; // Semua
      case 1:
        return allChats.where((chat) => chat.isDosen == false).toList();
      case 2:
        return allChats.where((chat) => chat.isDosen == true).toList();
      default:
        return allChats;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
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
        title: const Text('Halo, Julian'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Aksi untuk ikon search
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Aksi untuk ikon setting
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          // Menggunakan tampilan indikator default dan warna teks yang seragam
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: 'Semua Chat'),
            Tab(text: 'Teman'),
            Tab(text: 'Dosen'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatList(getChatsForTab(0)),
          _buildChatList(getChatsForTab(1)),
          _buildChatList(getChatsForTab(2)),
        ],
      ),
    );
  }

  Widget _buildChatList(List<ChatData> chats) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return _buildChatItem(chat);
      },
    );
  }

  Widget _buildChatItem(ChatData chat) {
    return Card(
      // Kartu chat menggunakan warna putih agar konten terlihat jelas
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[400],
          backgroundImage: NetworkImage(chat.imageUrl),
        ),
        title: Text(
          chat.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.nim,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              chat.lastMessage,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        trailing: Text(
          chat.time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        onTap: () {
          // Aksi saat item di-tap (misal: pindah ke halaman chat detail)
        },
      ),
    );
  }
}
