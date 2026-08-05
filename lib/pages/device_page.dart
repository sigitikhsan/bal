import 'package:flutter/material.dart';

class Device {
  final String name;
  final String category;
  final int stock;
  final String status;
  final String image;

  const Device({
    required this.name,
    required this.category,
    required this.stock,
    required this.status,
    required this.image,
  });
}

// Warna berdasarkan status perangkat
Color getStatusColor(String status) {
  switch (status) {
    case "Tersedia":
      return Colors.green;
    case "Dipinjam":
      return Colors.orange;
    case "Maintenance":
      return Colors.red;
    default:
      return Colors.grey;
  }
}

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = "Semua";

  final List<String> categories = const [
    "Semua",
    "Laptop",
    "HT",
    "Kamera",
    "Lainnya",
  ];

  final List<Device> devices = const [
    Device(
      name: "Laptop Lenovo ThinkPad X1",
      category: "Laptop",
      stock: 4,
      status: "Tersedia",
      image: "https://cdn-icons-png.flaticon.com/512/179/179386.png",
    ),
    Device(
      name: "Laptop Dell Latitude",
      category: "Laptop",
      stock: 2,
      status: "Dipinjam",
      image: "https://cdn-icons-png.flaticon.com/512/179/179386.png",
    ),
    Device(
      name: "HT Garmin GPSMAP 66i",
      category: "HT",
      stock: 3,
      status: "Tersedia",
      image: "https://cdn-icons-png.flaticon.com/512/1048/1048941.png",
    ),
    Device(
      name: "Canon EOS 90D",
      category: "Kamera",
      stock: 1,
      status: "Maintenance",
      image: "https://cdn-icons-png.flaticon.com/512/2920/2920244.png",
    ),
    Device(
      name: "Tablet Samsung Tab S8",
      category: "Lainnya",
      stock: 5,
      status: "Tersedia",
      image: "https://cdn-icons-png.flaticon.com/512/888/888879.png",
    ),
  ];

  List<Device> get filteredDevices {
    final keyword = searchController.text.trim().toLowerCase();

    return devices.where((device) {
      final sameCategory = selectedCategory == "Semua" ||
          device.category == selectedCategory;

      final sameSearch =
          device.name.toLowerCase().contains(keyword) ||
          device.category.toLowerCase().contains(keyword);

      return sameCategory && sameSearch;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayedDevices = filteredDevices;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Daftar Perangkat",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const SizedBox(height: 15),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: searchController,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Cari perangkat...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            searchController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Filter kategori
            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected = category == selectedCategory;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      showCheckmark: false,
                      selectedColor: const Color(0xff0A4DA3),
                      backgroundColor: Colors.white,
                      side: BorderSide.none,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Daftar perangkat
            Expanded(
              child: displayedDevices.isEmpty
                  ? const EmptyDeviceView()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
                      itemCount: displayedDevices.length,
                      itemBuilder: (context, index) {
                        final device = displayedDevices[index];

                        return DeviceCard(device: device);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({
    super.key,
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(device.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DeviceDetailPage(device: device),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                // Gambar perangkat
                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.network(
                      device.image,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.devices_other,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // Informasi perangkat
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        device.category,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            color: Colors.blue.shade700,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Stok: ${device.stock} unit",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          device.status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyDeviceView extends StatelessWidget {
  const EmptyDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 70,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 15),
            const Text(
              "Perangkat tidak ditemukan",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Coba gunakan kata pencarian atau kategori lain.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceDetailPage extends StatelessWidget {
  final Device device;

  const DeviceDetailPage({
    super.key,
    required this.device,
  });

  bool get canBorrow {
    return device.status == "Tersedia" && device.stock > 0;
  }

  String get deviceBrand {
    switch (device.category) {
      case "Laptop":
        return device.name.contains("Dell") ? "Dell" : "Lenovo";
      case "HT":
        return "Garmin";
      case "Kamera":
        return "Canon";
      case "Lainnya":
        return "Samsung";
      default:
        return "-";
    }
  }

  String get serialNumber {
    final categoryCode = device.category.toUpperCase().substring(0, 2);
    return "BM-$categoryCode-2026-001";
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(device.status);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text(
          "Detail Perangkat",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 30),
          child: Column(
            children: [
              // Gambar perangkat
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(38),
                  child: Hero(
                    tag: device.name,
                    child: Image.network(
                      device.image,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.devices_other,
                          size: 90,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Nama perangkat
              Text(
                device.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                device.category,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 12),

              // Status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  device.status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Informasi perangkat
              DetailSection(
                title: "Informasi Perangkat",
                children: [
                  DetailRow(
                    icon: Icons.category_outlined,
                    title: "Kategori",
                    value: device.category,
                  ),
                  const Divider(height: 25),
                  DetailRow(
                    icon: Icons.inventory_2_outlined,
                    title: "Stok",
                    value: "${device.stock} unit",
                  ),
                  const Divider(height: 25),
                  DetailRow(
                    icon: Icons.info_outline,
                    title: "Status",
                    value: device.status,
                    valueColor: statusColor,
                  ),
                  const Divider(height: 25),
                  DetailRow(
                    icon: Icons.business_outlined,
                    title: "Merek",
                    value: deviceBrand,
                  ),
                  const Divider(height: 25),
                  DetailRow(
                    icon: Icons.qr_code_2,
                    title: "Serial Number",
                    value: serialNumber,
                  ),
                  const Divider(height: 25),
                  const DetailRow(
                    icon: Icons.calendar_month_outlined,
                    title: "Tahun",
                    value: "2026",
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Deskripsi
              const DetailSection(
                title: "Deskripsi",
                children: [
                  Text(
                    "Perangkat inventaris Balai Monitor yang dapat digunakan "
                    "oleh pegawai untuk mendukung kegiatan operasional, "
                    "monitoring, dan pelaksanaan tugas lapangan.",
                    style: TextStyle(
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Tombol peminjaman
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: Icon(
                    canBorrow
                        ? Icons.assignment_outlined
                        : Icons.block_outlined,
                  ),
                  label: Text(
                    canBorrow
                        ? "Ajukan Peminjaman"
                        : "Perangkat Tidak Tersedia",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canBorrow
                        ? const Color(0xff0A4DA3)
                        : Colors.grey.shade400,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade400,
                    disabledForegroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: canBorrow
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Pengajuan peminjaman ${device.name} dipilih.",
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DetailSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xff0A4DA3).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.info_outline,
            color: Color(0xff0A4DA3),
            size: 21,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: valueColor ?? Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}