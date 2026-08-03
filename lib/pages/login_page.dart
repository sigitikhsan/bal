import 'package:flutter/material.dart';
import 'register_page.dart';
import 'user_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk mengambil isi input
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Untuk menampilkan atau menyembunyikan password
  bool passwordTersembunyi = true;

  var isLoading = false;
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi sementara di frontend
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Username dan password harus diisi',
          ),
        ),
      );
      return;
    } 
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => 
          const UserHomePage(),
          ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFF304B70),

        title: const Text(
          'Login SIMBA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(28),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: 0.1,
                    ),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 90,
                    color: Color(0xFF304B70),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Silakan masuk ke akun Anda',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: usernameController,

                    decoration: InputDecoration(
                      labelText: 'Username',

                      prefixIcon: const Icon(
                        Icons.person_outline,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextField(
                    controller: passwordController,

                    obscureText: passwordTersembunyi,

                    decoration: InputDecoration(
                      labelText: 'Password',

                      prefixIcon: const Icon(
                        Icons.lock_outline,
                      ),

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordTersembunyi =
                                !passwordTersembunyi;
                          });
                        },

                        icon: Icon(
                          passwordTersembunyi
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Fitur lupa password belum dibuat',
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Color(0xFF304B70),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: login,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF304B70),

                        foregroundColor:
                            Colors.white,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),

                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      const Text(
                        'Belum punya akun?',
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },

                        child: const Text(
                          'Daftar Sekarang',
                          style: TextStyle(
                            color:
                                Color(0xFF304B70),

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}