import 'package:flutter/material.dart';

class ReturnDetailPage extends StatelessWidget {

  final String device;
  final String borrow;
  final String deadline;

  const ReturnDetailPage({
    super.key,
    required this.device,
    required this.borrow,
    required this.deadline,
  });

  Widget info(String title,String value){

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
        title: const Text("Detail Pengembalian"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            info("Perangkat",device),

            info("Tanggal Pinjam",borrow),

            info("Batas Pengembalian",deadline),

            const SizedBox(height:30),

            const Icon(
              Icons.assignment_return,
              size:90,
              color: Colors.blue,
            ),

            const SizedBox(height:15),

            const Text(
              "Pastikan perangkat dalam kondisi baik sebelum dikembalikan.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:16,
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton.icon(

                icon: const Icon(Icons.check),

                label: const Text("Konfirmasi Pengembalian"),

                onPressed: (){

                  showDialog(

                    context: context,

                    builder: (_){

                      return AlertDialog(

                        title: const Text("Berhasil"),

                        content: const Text(
                          "Pengembalian perangkat berhasil dikirim.\nSilakan serahkan perangkat kepada admin."
                        ),

                        actions: [

                          TextButton(

                            onPressed: (){

                              Navigator.pop(context);

                              Navigator.pop(context);

                            },

                            child: const Text("OK"),

                          )

                        ],

                      );

                    },

                  );

                },

              ),

            )

          ],

        ),

      ),

    );

  }

}