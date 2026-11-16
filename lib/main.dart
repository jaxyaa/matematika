import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JarakPage(),
    );
  }
}

class JarakPage extends StatefulWidget {
  @override
  State<JarakPage> createState() => _JarakPageState();
}

class _JarakPageState extends State<JarakPage> {
  final waktu = TextEditingController();
  final kecepatan = TextEditingController();

  String hasil = "";

  void hitungJarak() {
    double t = double.parse(waktu.text);
    double v = double.parse(kecepatan.text);

    double s = t * v;

    setState(() {
      hasil = "Jarak = $s";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menghitung Jarak"),
        backgroundColor: Color(0xffa2f8f8),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: waktu,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan waktu (t)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: kecepatan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Masukkan kecepatan (v)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungJarak,
              child: Text("Hitung Jarak"),
            ),
            SizedBox(height: 20),
            Text(
              hasil,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
