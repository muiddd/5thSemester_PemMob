import 'dart:io';
import 'mata_kuliah.dart';

void main() {
  List<MataKuliah> transkrip = [
    MataKuliah('IF101', 'Algoritma', 3, 3.5),
    MataKuliah('IF102', 'Basis Data', 3, 4.0),
    MataKuliah('IF103', 'Pemrograman', 4, 3.0),
  ];

  bool running = true;

  print('=====================================================');
  print('  APLIKASI PENGELOLAAN TRANSKRIP NILAI MAHASISWA   ');
  print('     (Paradigma Functional Programming di Dart)      ');
  print('=====================================================');

  while (running) {
    print('\n------------------- MENU UTAMA -------------------');
    print('1. Hitung IPK (menggunakan map & reduce)');
    print('2. Filter Nilai Bagus (>= 3.5 menggunakan where)');
    print('3. Menampilkan Nilai Terformat (menggunakan map & forEach)');
    print('4. Tampilkan Daftar Lengkap Transkrip');
    print('5. Tambah Mata Kuliah Baru');
    print('0. Keluar');
    stdout.write('Pilih menu [0-5]: ');

    String? input = stdin.readLineSync()?.trim();

    switch (input) {
      case '1':
        hitungIpk(transkrip);
        break;
      case '2':
        filterNilaiBagus(transkrip);
        break;
      case '3':
        tampilkanNilaiTerformat(transkrip);
        break;
      case '4':
        tampilkanDaftarLengkap(transkrip);
        break;
      case '5':
        tambahMataKuliah(transkrip);
        break;
      case '0':
        print('\nTerima kasih telah menggunakan program Transkrip Mahasiswa!');
        running = false;
        break;
      default:
        print('\n[!] Pilihan tidak valid. Silakan masukkan angka 0 sampai 5.');
    }
  }
}

/// 1. Hitung IPK menggunakan Functional Programming (map & reduce)
void hitungIpk(List<MataKuliah> transkrip) {
  print('\n=== 1. HITUNG IPK (FP: map & reduce) ===');
  if (transkrip.isEmpty) {
    print('Daftar transkrip kosong.');
    return;
  }

  // Hitung total bobot nilai (nilai * sks) dengan map dan reduce
  double totalNilai = transkrip
      .map((mk) => mk.nilai * mk.sks)
      .reduce((a, b) => a + b);

  // Hitung total SKS dengan map dan reduce
  int totalSks = transkrip.map((mk) => mk.sks).reduce((a, b) => a + b);

  double ipk = totalNilai / totalSks;

  print('Total Bobot Nilai : ${totalNilai.toStringAsFixed(2)}');
  print('Total SKS         : $totalSks');
  print('IPK               : ${ipk.toStringAsFixed(2)}');
}

/// 2. Filter Nilai Bagus menggunakan Functional Programming (where)
void filterNilaiBagus(List<MataKuliah> transkrip) {
  print('\n=== 2. FILTER NILAI BAGUS (FP: where >= 3.5) ===');
  var nilaiBagus = transkrip.where((mk) => mk.nilai >= 3.5);

  if (nilaiBagus.isEmpty) {
    print('Tidak ada mata kuliah dengan nilai >= 3.5.');
    return;
  }

  print('Mata kuliah dengan nilai bagus:');
  for (var mk in nilaiBagus) {
    print('${mk.nama} (${mk.nilai})');
  }
}

/// 3. Menampilkan Nilai Terformat menggunakan Functional Programming (map & forEach)
void tampilkanNilaiTerformat(List<MataKuliah> transkrip) {
  print('\n=== 3. FORMAT DAFTAR RINGKAS (FP: map & forEach) ===');
  if (transkrip.isEmpty) {
    print('Daftar transkrip kosong.');
    return;
  }

  print('Daftar Ringkas:');
  transkrip.map((mk) => '${mk.nama}: ${mk.nilai}').forEach(print);
}

/// 4. Tampilkan Daftar Lengkap Transkrip
void tampilkanDaftarLengkap(List<MataKuliah> transkrip) {
  print('\n=== 4. DAFTAR LENGKAP TRANSKRIP ===');
  if (transkrip.isEmpty) {
    print('Daftar transkrip kosong.');
    return;
  }

  print('------------------------------------------------------------');
  print('| No | Kode   | Nama Mata Kuliah         | SKS | Nilai     |');
  print('------------------------------------------------------------');
  for (int i = 0; i < transkrip.length; i++) {
    var mk = transkrip[i];
    var no = (i + 1).toString().padRight(2);
    var kode = mk.kode.padRight(6);
    var nama = mk.nama.padRight(24);
    var sks = mk.sks.toString().padRight(3);
    var nilai = mk.nilai.toStringAsFixed(2).padRight(9);
    print('| $no | $kode | $nama | $sks | $nilai |');
  }
  print('------------------------------------------------------------');
}

/// 5. Tambah Mata Kuliah Baru
void tambahMataKuliah(List<MataKuliah> transkrip) {
  print('\n=== 5. TAMBAH MATA KULIAH BARU ===');
  stdout.write('Masukkan Kode MK (contoh: IF104): ');
  String kode = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Masukkan Nama MK (contoh: Struktur Data): ');
  String nama = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Masukkan Jumlah SKS (contoh: 3): ');
  int? sks = int.tryParse(stdin.readLineSync()?.trim() ?? '');

  stdout.write('Masukkan Nilai Indeks (contoh: 3.75): ');
  double? nilai = double.tryParse(stdin.readLineSync()?.trim() ?? '');

  if (kode.isEmpty || nama.isEmpty || sks == null || nilai == null) {
    print('[!] Input tidak valid. Mata kuliah gagal ditambahkan.');
    return;
  }

  transkrip.add(MataKuliah(kode, nama, sks, nilai));
  print('[✓] Mata kuliah $nama ($kode) berhasil ditambahkan ke transkrip!');
}
