import 'dart:io';
import 'package:dart_image_grabber/image_grabber.dart';

void main(List<String> arguments) async {
  print('Selamat datang di Dart Image Grabber!');

  stdout.write('Inputkan halaman web: ');
  String? url = stdin.readLineSync();

  stdout.write('Masukkan folder tujuan: ');
  String? outputFolder = stdin.readLineSync();

  if (url != null &&
      url.trim().isNotEmpty &&
      outputFolder != null &&
      outputFolder.trim().isNotEmpty) {
    ImageGrabber grabber = ImageGrabber(url.trim(), outputFolder.trim());
    await grabber.run();
  }
}
