import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import 'pemilihan_confirm_page.dart';

class LoanFormPage extends StatefulWidget {
  final String deviceName;

  const LoanFormPage({super.key, required this.deviceName});

  @override
  State<LoanFormPage> createState() => _LoanFormPageState();
}

class _LoanFormPageState extends State<LoanFormPage> {
  final reasonController = TextEditingController();

  DateTime? borrowDate;

  int duration = 1;

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        borrowDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Peminjaman")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Perangkat",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              readOnly: true,
              controller: TextEditingController(text: widget.deviceName),
            ),

            const SizedBox(height: 20),

            const Text(
              "Alasan Peminjaman",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Masukkan alasan peminjaman...",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Tanggal Pinjam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            InkWell(
              onTap: pickDate,

              child: Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),

                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),

                    const SizedBox(width: 15),

                    Text(
                      borrowDate == null
                          ? "Pilih tanggal"
                          : "${borrowDate!.day}/${borrowDate!.month}/${borrowDate!.year}",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Lama Pinjam",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            DropdownButtonFormField<int>(
              value: duration,

              items: List.generate(
                14,

                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text("${index + 1} Hari"),
                ),
              ),

              onChanged: (value) {
                setState(() {
                  duration = value!;
                });
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  if (reasonController.text.isEmpty || borrowDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Lengkapi data terlebih dahulu"),
                      ),
                    );

                    return;
                  }

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => PemilihanConfirmPage(
                        device: widget.deviceName,
                        reason: reasonController.text,
                        date:
                            "${borrowDate!.day}/${borrowDate!.month}/${borrowDate!.year}",
                        duration: duration,
                      ),
                    ),
                  );
                },

                child: const Text("Selanjutnya"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
