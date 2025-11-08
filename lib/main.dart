import 'package:flutter/material.dart';
import 'package:h1d023024_tugas6/ui/form_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Data Mahasiswa',
      home: const FormDataMhs(),
    );
  }
}
