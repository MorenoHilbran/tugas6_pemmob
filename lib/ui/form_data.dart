import 'package:flutter/material.dart';
import 'package:h1d023024_tugas6/ui/tampil_data.dart';

class FormDataMhs extends StatefulWidget {
  const FormDataMhs({Key? key}) : super(key: key);

  @override
  _FormDataMhsState createState() => _FormDataMhsState();
}

class _FormDataMhsState extends State<FormDataMhs> {
  final _namaMhsController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Data Mahasiswa'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            _textboxnamaMhs(),
            _textboxnim(),
            _textboxHarga(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxnamaMhs() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaMhsController,
    ); // TextField
  }

  _textboxnim() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIM"),
      controller: _nimController,
    ); // TextField
  }

  _textboxHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tahun Lahir"),
      controller: _tahunLahirController,
    ); // TextField
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String namaMhs = _namaMhsController.text;
        String nim = _nimController.text;
        int harga = int.parse(_tahunLahirController.text);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DataMahasiswa(
              namaMhs: namaMhs,
              nim: nim,
              tahunLahir: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan')); // ElevatedButton
  }
}