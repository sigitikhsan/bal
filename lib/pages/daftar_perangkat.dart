import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final List<Map<String, dynamic>> devices = [
    {
      "name": "Laptop Dell Latitude",
      "type": "Laptop",
      "status": "Tersedia",
      "icon": Icons.laptop,
    },

    {
      "name": "Handy Talky Motorola",
      "type": "HT",
      "status": "Dipinjam",
      "icon": Icons.settings_input_antenna,
    },

    {
      "name": "GPS Garmin 64s",
      "type": "GPS",
      "status": "Tersedia",
      "icon": Icons.gps_fixed,
    },

    {
      "name": "Drone DJI Mini",
      "type": "Drone",
      "status": "Tersedia",
      "icon": Icons.flight,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Daftar Perangkat")),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari perangkat...",

                prefixIcon: const Icon(Icons.search),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: devices.length,

              itemBuilder: (context, index) {
                final item = devices[index];

                bool tersedia = item["status"] == "Tersedia";

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(.15),

                      child: Icon(item["icon"], color: AppColors.primary),
                    ),

                    title: Text(
                      item["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(item["type"]),

                        const SizedBox(height: 4),

                        Text(
                          item["status"],

                          style: TextStyle(
                            color: tersedia ? Colors.green : Colors.red,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tersedia
                            ? AppColors.primary
                            : Colors.grey,

                        minimumSize: const Size(90, 40),
                      ),

                      onPressed: tersedia
                          ? () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${item["name"]} dipilih"),
                                ),
                              );
                            }
                          : null,

                      child: Text(
                        tersedia ? "Pinjam" : "Tidak Ada",

                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
