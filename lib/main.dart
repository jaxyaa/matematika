import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JarakPage(),
    );
  }
}

class JarakPage extends StatefulWidget {
  const JarakPage({super.key});

  @override
  State<JarakPage> createState() => _JarakPageState();
}

class _JarakPageState extends State<JarakPage> {
  final TextEditingController waktu = TextEditingController();
  final TextEditingController kecepatan = TextEditingController();

  String hasil = "";

  void hitungJarak() {
    // Ganti koma dengan titik supaya input "2,5" tetap terbaca
    final double? t = double.tryParse(waktu.text.replaceAll(',', '.'));
    final double? v = double.tryParse(kecepatan.text.replaceAll(',', '.'));

    if (t == null || v == null) {
      setState(() {
        hasil = "Masukkan angka yang valid";
      });
      return;
    }

    final double s = t * v;

    setState(() {
      hasil = "Jarak = ${s.toStringAsFixed(2)}";
    });
  }

  @override
  void dispose() {
    waktu.dispose();
    kecepatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menghitung Jarak"),
        backgroundColor: const Color(0xff57ebf6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: waktu,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Masukkan waktu (t)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: kecepatan,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Masukkan kecepatan (v)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungJarak,
              child: const Text("Hitung Jarak"),
            ),
            const SizedBox(height: 20),
            Text(
              hasil,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
