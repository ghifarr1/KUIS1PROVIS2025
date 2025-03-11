import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const MySocialMediaApp());
}

/// Kelas statis untuk palet warna
class AppColors {
  static const Color background = Color(0xFF1D1616);
  static const Color primary = Color(0xFF8E1616);
  static const Color accent = Color(0xFFFFD65A);
  static const Color error = Color(0xFFD84040);
  static const Color neutral = Color(0xFFEEEEEE);
}

class MySocialMediaApp extends StatelessWidget {
  const MySocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Social Media',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const SosmedPage(),
    );
  }
}

/// Model data untuk post
class Post {
  final String userName;
  final String userAvatar;
  final String major;
  final String postTime;
  final String postImageUrl;
  final String content;

  Post({
    required this.userName,
    required this.userAvatar,
    required this.major,
    required this.postTime,
    required this.postImageUrl,
    required this.content,
  });
}

class SosmedPage extends StatefulWidget {
  const SosmedPage({Key? key}) : super(key: key);

  @override
  State<SosmedPage> createState() => _SosmedPageState();
}

class _SosmedPageState extends State<SosmedPage> {
  /// Contoh data dummy stories (gambar profil)
  final List<String> stories = [
    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
    'https://images.unsplash.com/photo-1463453091185-61582044d556',
    'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df',
    'https://images.unsplash.com/photo-1594745560568-0ef8d1c1aef0',
  ];

  /// Contoh data dummy postingan (setiap post pakai gambar berbeda dari Unsplash)
  final List<Post> posts = [
    Post(
      userName: 'Julian Dwi Satrio',
      userAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
      major: 'Ilmu Komputer',
      postTime: '6h',
      // Foto pemandangan pantai
      postImageUrl:
      'https://images.unsplash.com/photo-1519608487953-e999c86e7455',
      content: 'Liburan ke pantai, suasana angin lautnya bikin rileks banget!',
    ),
    Post(
      userName: 'Alex Johnson',
      userAvatar: 'https://images.unsplash.com/photo-1589571894960-20bbe2828b12',
      major: 'Pendidikan Bahasa Inggris',
      postTime: '2h',
      // Foto pemandangan pegunungan
      postImageUrl:
      'https://images.unsplash.com/photo-1506459225024-1428097a7e18',
      content: 'Mendaki gunung di akhir pekan. Pemandangannya luar biasa!',
    ),
    Post(
      userName: 'Sarah Williams',
      userAvatar: 'https://images.unsplash.com/photo-1544723795-3fb6469f29d1',
      major: 'Sistem Informasi',
      postTime: '1d',
      // Foto pemandangan danau
      postImageUrl:
      'https://images.unsplash.com/photo-1491553895911-0055eca6402d',
      content: 'Danau tenang di sore hari, tempat sempurna untuk refleksi diri.',
    ),
    Post(
      userName: 'Michael Lee',
      userAvatar: 'https://images.unsplash.com/photo-1544723795-3fb6469f29d1',
      major: 'Teknik Elektro',
      postTime: '3d',
      // Foto pemandangan kota di malam hari
      postImageUrl:
      'https://images.unsplash.com/photo-1483683804023-6ccdb62f86ef',
      content: 'Menikmati suasana malam kota dari rooftop café!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar Sesuai Referensi
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
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
                'Media Sosial',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // Aksi profil
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian "Stories"
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: stories.length,
                separatorBuilder: (context, index) =>
                const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.accent,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(stories[index]),
                    ),
                  );
                },
              ),
            ),

            // Bagian "New Post" / "Posting Sesuatu..."
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.neutral,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Posting Sesuatu...',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Aksi jika user mau upload gambar
                    },
                    icon: Icon(Icons.photo_camera, color: AppColors.primary),
                  ),
                ],
              ),
            ),

            // List Post
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget untuk menampilkan satu post
class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.neutral,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian header: avatar + nama + major + waktu
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.userAvatar),
            ),
            title: Text(
              post.userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${post.major} • ${post.postTime}'),
          ),
          // Konten teks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post.content,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
          const SizedBox(height: 8),
          // Gambar posting (jika ada)
          if (post.postImageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                post.postImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 8),
          // Baris aksi (Like, Comment, Repost, Send)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.black,
                  onPressed: () {
                    // Aksi like
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  color: Colors.black,
                  onPressed: () {
                    // Aksi comment
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.repeat),
                  color: Colors.black,
                  onPressed: () {
                    // Aksi repost
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.black,
                  onPressed: () {
                    // Aksi send/share
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
