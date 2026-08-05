import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import '../admin/dashboard/admin_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Kunci unik untuk mengontrol status validasi Form
  final _formKey = GlobalKey<FormState>();

  bool remember = false;
  bool hidePassword = true;

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          // 2. Bungkus seluruh kolom input dengan widget Form
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),

                // FITUR LOGO IMAGE (Diubah dari Icon menjadi Image.asset)
                Container(
                  width: 130,
                  height: 130,
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    'assets/images/lo_screen.png', // Ganti sesuai nama file logo Anda
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Selamat Datang!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Silakan masuk untuk melanjutkan",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 35),

                // 3. TextFormField Username
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: "NIP / Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // 4. TextFormField Password
                TextFormField(
                  controller: password,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      onChanged: (v) {
                        setState(() {
                          remember = v!;
                        });
                      },
                    ),
                    const Text("Ingat saya"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Lupa Password?"),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Cek apakah input sudah valid
                      if (_formKey.currentState!.validate()) {
                        final inputUsername = username.text.trim();
                        final inputPassword = password.text.trim();

                        // Jika username admin dan password 123456
                        if (inputUsername == 'admin' &&
                            inputPassword == '123456') {
                          // Masuk ke Dashboard Admin
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AdminDashboardPage(),
                            ),
                          );
                        } else {
                          // Selain akun admin masuk ke Dashboard User
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DashboardPage(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "atau masuk dengan",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("SSO Balmon"),
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Belum punya akun?",
                  style: TextStyle(color: Colors.grey),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text("Hubungi Admin"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}