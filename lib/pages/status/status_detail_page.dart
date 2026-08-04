import 'package:flutter/material.dart';

class StatusDetailPage extends StatelessWidget {
  final String device;
  final String date;
  final String status;

  const StatusDetailPage({
    super.key,
    required this.device,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Detail Status"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.devices),
                title: Text(device),
                subtitle: const Text("Perangkat"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(date),
                subtitle: const Text("Tanggal Pinjam"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.assignment_turned_in),
                title: Text(status),
                subtitle: const Text("Status"),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text("Permohonan dikirim"),
            ),

            const ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text("Menunggu persetujuan admin"),
            ),

            ListTile(
              leading: Icon(
                status == "Disetujui"
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: status == "Disetujui"
                    ? Colors.green
                    : Colors.grey,
              ),
              title: const Text("Disetujui"),
            ),

            ListTile(
              leading: Icon(
                status == "Selesai"
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: status == "Selesai"
                    ? Colors.green
                    : Colors.grey,
              ),
              title: const Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}