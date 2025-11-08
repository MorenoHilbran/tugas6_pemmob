import 'package:flutter/material.dart';

class DataMahasiswa extends StatelessWidget {
  final String namaMhs;
  final String nim;
  final int tahunLahir;

  const DataMahasiswa({
    Key? key,
    required this.namaMhs,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama saya $namaMhs, NIM $nim, dan umur saya adalah ${2025 - tahunLahir} tahun."),
          ],
        ),
      ),
    );
  }
}
