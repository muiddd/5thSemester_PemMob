import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuatJurnalPage extends StatefulWidget
{
  final String title = 'Buat Jurnal';

  const BuatJurnalPage({super.key});

  @override
  State<StatefulWidget> createState()
  {
    return _BuatJurnalPageState();
  }
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsGeometry.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kelas:'),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan Kelas',
                      ),
                      onChanged: (value) => {},
                    ),
                    SizedBox(height: 10),
                    Text('Nama Mapel'),
                    SizedBox(height: 10),
                    TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Masukkan Nama Mapel',
                        ),
                        onChanged: (value) => {}
                    ),
                  ],
                ),
              )
        )
    );
  }
}
