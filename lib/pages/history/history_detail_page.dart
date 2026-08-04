import 'package:flutter/material.dart';

class HistoryDetailPage extends StatelessWidget {

  final String device;
  final String borrow;
  final String returns;
  final String status;

  const HistoryDetailPage({
    super.key,
    required this.device,
    required this.borrow,
    required this.returns,
    required this.status,
  });

  Widget item(String title,String value){

    return Card(

      child: ListTile(

        title: Text(title),

        subtitle: Text(value),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Detail Riwayat"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            item("Perangkat",device),

            item("Tanggal Pinjam",borrow),

            item("Tanggal Kembali",returns),

            item("Status",status),

            const SizedBox(height:25),

            const Icon(
              Icons.history,
              size:90,
              color: Colors.blue,
            ),

            const SizedBox(height:15),

            const Text(
              "Riwayat peminjaman selesai.",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold,
              ),
            )

          ],

        ),

      ),

    );

  }

}