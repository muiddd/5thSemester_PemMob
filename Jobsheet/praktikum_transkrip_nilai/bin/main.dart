import 'dart:io';
import 'mata_kuliah.dart';

void main() {
  List<MataKuliah> transkrip = [
    MataKuliah('IF101', 'Algoritma', 3, 3.5),
    MataKuliah('IF102', 'Basis Data', 3, 4.0),
    MataKuliah('IF103', 'Pemrograman', 4, 3.0),
  ];

  while (true) {
    print('\n========================================');
    print('  PROGRAM TRANSKRIP NILAI MAHASISWA (FP)');
    print('========================================');
    print('1. Hitung IPK');
    print('2. Filter Nilai Bagus');
    print('3. Menampilkan Nilai Terformat');
    print('4. Keluar');
    stdout.write('Pilih opsi (1-4): ');

    String? input = stdin.readLineSync()?.trim();

    switch (input) {
      case '1':
        // Hitung IPK menggunakan map() dan reduce()
        print('\n--- Hitung IPK ---');
        double totalNilai = transkrip
            .map((mk) => mk.nilai * mk.sks)
            .reduce((a, b) => a + b);

        int totalSks = transkrip.map((mk) => mk.sks).reduce((a, b) => a + b);

        double ipk = totalNilai / totalSks;

        print('IPK: ${ipk.toStringAsFixed(2)}');
        break;

      case '2':
        // Filter Nilai Bagus (>= 3.5) menggunakan where()
        print('\n--- Filter Nilai Bagus ---');
        var nilaiBagus = transkrip.where((mk) => mk.nilai >= 3.5);
        print('Mata kuliah dengan nilai bagus:');
        for (var mk in nilaiBagus) {
          print('${mk.nama} (${mk.nilai})');
        }
        break;

      case '3':
        // Menampilkan Nilai Terformat menggunakan map()
        print('\n--- Menampilkan Nilai Terformat ---');
        print('Daftar Ringkas:');
        transkrip.map((mk) => '${mk.nama}: ${mk.nilai}').forEach(print);
        break;

      case '4':
        print('\nTerima kasih! Program selesai.');
        return;

      default:
        print('\nPilihan tidak valid! Silakan pilih nomor 1 sampai 4.');
        break;
    }
  }
}
