import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class PemilihanConfirmPage extends StatelessWidget {
  final String device;
  final String reason;
  final String date;
  final int duration;

  const PemilihanConfirmPage({
    super.key,
    required this.device,
    required this.reason,
    required this.date,
    required this.duration,
  });

  Widget item(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),

            const SizedBox(height: 6),

            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konfirmasi")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            item("Perangkat", device),

            item("Alasan", reason),

            item("Tanggal Pinjam", date),

            item("Durasi", "$duration Hari"),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),

                label: const Text("Kirim Permohonan"),

                onPressed: () {
                  showDialog(
                    context: context,

                    builder: (_) {
                      return AlertDialog(
                        title: const Text("Berhasil"),

                        content: const Text(
                          "Permohonan peminjaman berhasil dikirim.\nSilakan menunggu persetujuan admin.",
                        ),

                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Navigator.popUntil(
                                context,
                                (route) => route.isFirst,
                              );
                            },

                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
