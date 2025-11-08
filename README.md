# tugas_6_pemmob

-----

## Peran File dalam Proses

1.  **`lib/main.dart`**: Ini adalah file utama yang menjalankan aplikasi. File ini mengatur `FormDataMhs` (dari `form_data.dart`) sebagai layar utama (*home*) aplikasi.
2.  **`lib/ui/form_data.dart`**: File ini berisi *screen* (layar) formulir input data mahasiswa (`FormDataMhs`). Di sinilah pengguna memasukkan data.
3.  **`lib/ui/tampil_data.dart`**: File ini berisi *screen* (`DataMahasiswa`) yang bertugas menerima dan menampilkan data yang telah diinput dari form.
4.  **`README.md`**: Ini adalah file dokumentasi standar untuk proyek Flutter. File ini berisi deskripsi umum proyek ("A new Flutter project.") dan tautan ke dokumentasi Flutter. File ini **tidak terlibat** dalam logika *passing data* aplikasi, namun hanya memberikan konteks bahwa ini adalah proyek Flutter standar.

-----

## Langkah-langkah Passing Data

Berikut adalah urutan lengkap bagaimana data berpindah dari `form_data.dart` ke `tampil_data.dart`:

### 1\. Pengisian Data di Form (`form_data.dart`)

Di dalam file `lib/ui/form_data.dart`, terdapat *widget* `FormDataMhs` yang memiliki:

  * Tiga `TextEditingController` untuk menangani input teks: `_namaMhsController`, `_nimController`, dan `_tahunLahirController`.
  * Sebuah tombol "Simpan" yang didefinisikan dalam `_tombolSimpan()`.

### 2\. Pengiriman Data Saat Tombol Ditekan (`form_data.dart`)

Ketika pengguna menekan tombol "Simpan", fungsi `onPressed` di dalam `_tombolSimpan()` dieksekusi:

  * **Pengambilan Data:** Data diambil dari setiap *controller* menggunakan properti `.text`.

    ```dart
    String namaMhs = _namaMhsController.text;
    String nim = _nimController.text;
    int harga = int.parse(_tahunLahirController.text); 
    // Variabel 'harga' digunakan untuk menampung tahun lahir
    ```

  * **Navigasi & Passing Data:** Aplikasi kemudian berpindah layar menggunakan `Navigator.of(context).push()`. Di sinilah proses *passing data* terjadi.

    ```dart
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DataMahasiswa(
          namaMhs: namaMhs,     // Data namaMhs dilewatkan
          nim: nim,             // Data nim dilewatkan
          tahunLahir: harga,    // Data tahunLahir (dari var 'harga') dilewatkan
        ),
      ),
    );
    ```

    Secara efektif, data yang diambil dari form **dilewatkan sebagai parameter ke constructor** dari *widget* `DataMahasiswa`.

### 3\. Penerimaan Data di Tampilan (`tampil_data.dart`)

Di dalam file `lib/ui/tampil_data.dart`, *widget* `DataMahasiswa` dirancang untuk menerima data tersebut:

  * **Deklarasi Properti:** *Widget* ini mendeklarasikan variabel `final` untuk menyimpan data yang akan diterimanya.

    ```dart
    final String namaMhs;
    final String nim;
    final int tahunLahir;
    ```

  * **Constructor:** *Widget* ini memiliki *constructor* yang **mewajibkan** (`required`) parameter-parameter tersebut diisi saat *widget* ini dibuat.

    ```dart
    const DataMahasiswa({
      Key? key,
      required this.namaMhs,
      required this.nim,
      required this.tahunLahir,
    }) : super(key: key);
    ```

### 4\. Penampilan Data (`tampil_data.dart`)

Terakhir, di dalam *method* `build` pada `DataMahasiswa`, data yang sudah tersimpan di properti *widget* (seperti `namaMhs` dan `nim`) digunakan untuk ditampilkan di layar. Aplikasi juga melakukan kalkulasi umur sederhana berdasarkan data `tahunLahir` yang diterima.

```dart
Text("Nama saya $namaMhs, NIM $nim, dan umur saya adalah ${2025 - tahunLahir} tahun."),
```
