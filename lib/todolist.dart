import 'package:flutter/material.dart';
import 'main.dart'; // Pastikan file main.dart berisi kelas KuisMainPage

void main() {
  runApp(const MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const ToDoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Model data untuk Task
class Task {
  final String title;
  final String dueDate;
  bool isDone;

  Task({
    required this.title,
    required this.dueDate,
    this.isDone = false,
  });
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // Daftar tugas (contoh awal)
  final List<Task> tasks = [
    Task(title: 'Tubes Provis', dueDate: '13/03/2025'),
    Task(title: 'Tubes DPBO', dueDate: '13/03/2025'),
    Task(title: 'Tubes Big Data', dueDate: '13/03/2025'),
    Task(title: 'Tubes Andal', dueDate: '13/03/2025'),
    Task(title: 'Tubes Sistem Operasi', dueDate: '13/03/2025'),
  ];

  // Controller untuk menampung input judul tugas baru
  final TextEditingController _taskTitleController = TextEditingController();
  // Controller untuk menampung input due date tugas baru
  final TextEditingController _taskDateController = TextEditingController();

  // Metode untuk menambahkan tugas baru
  void _addTask(String title, String date) {
    setState(() {
      tasks.add(Task(title: title, dueDate: date));
    });
  }

  // Metode untuk menampilkan dialog input tugas baru
  Future<void> _showAddTaskDialog() async {
    _taskTitleController.clear();
    _taskDateController.clear();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // dialog tidak tertutup jika user tap di luar
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kNeutralColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Text(
            'Tambah Tugas Baru',
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _taskTitleController,
                  decoration: const InputDecoration(
                    labelText: 'Judul Tugas',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                TextField(
                  controller: _taskDateController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal (dd/mm/yyyy)',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kDangerColor),
              child: const Text('Tambah', style: TextStyle(color: Colors.white)),
              onPressed: () {
                final title = _taskTitleController.text.trim();
                final date = _taskDateController.text.trim();
                if (title.isNotEmpty && date.isNotEmpty) {
                  _addTask(title, date);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Widget untuk menampilkan setiap item tugas
  Widget _buildTaskItem(Task task, int index) {
    return Card(
      color: kListBackgroundColor, // Menggunakan warna abu untuk background item list
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              task.isDone = !task.isDone;
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: task.isDone ? kSecondaryColor : Colors.grey,
              ),
            ),
            child: task.isDone
                ? Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor,
              ),
            )
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            decoration:
            task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          task.dueDate,
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            setState(() {
              tasks.removeAt(index);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
        title: const Text('To-Do List'),
        backgroundColor: kSecondaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Container bagian atas (tanggal + "To-Do List Hari Ini" + Jumlah Tugas + Tombol Tambah Tugas)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: kNeutralColor,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Bagian Tanggal
                    Text(
                      '11 Maret',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Row "To-Do List Hari Ini" + "x Tugas" + Button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kiri: "To-Do List Hari Ini" dan jumlah tugas
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To-Do List Hari Ini!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${tasks.length} Tugas',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Kanan: Tombol "Tambah Tugas"
                        ElevatedButton(
                          onPressed: _showAddTaskDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kDangerColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 2,
                          ),
                          child: const Text(
                            'Tambah Tugas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Text "List Tugas"
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'List Tugas',
                  style: TextStyle(
                    color: kAccentColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // List Tugas
              for (int i = 0; i < tasks.length; i++) _buildTaskItem(tasks[i], i),
            ],
          ),
        ),
      ),
    );
  }
}

// Konstanta warna sesuai color palette
const Color kPrimaryColor = Color(0xFF1D1616);   // Latar utama Scaffold
const Color kSecondaryColor = Color(0xFF8E1616); // AppBar, penanda isDone
const Color kAccentColor = Color(0xFFFFD65A);    // FAB
const Color kDangerColor = Color(0xFFD84040);    // Tombol "Tambah Tugas"
const Color kNeutralColor = Color(0xFFEEEEEE);   // Container/Card (header)
const Color kListBackgroundColor = Color(0xFFCCCCCC); // Background untuk item list (abu)
