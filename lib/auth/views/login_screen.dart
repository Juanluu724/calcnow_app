import 'package:flutter/material.dart';
import '../data/usuarios_local.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text.trim();
    final pass = _passwordController.text.trim();

    final existe = usuarios.any(
      (u) => u["email"] == email && u["password"] == pass,
    );

    if (existe) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Credenciales incorrectas")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F8),
      body: SafeArea(
        child: Stack(
          children: [
            /// -------- ICONO HOME ARRIBA DERECHA ----------
            Positioned(
              top: 25,
              right: 25,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Icon(
                    Icons.home_outlined,
                    size: 40,      // MÁS GRANDE
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            /// -------- CONTENIDO PRINCIPAL ----------
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 45),

                    /// TITULO + SUBTITULO
                    const Text(
                      "Nos alegra volver a verte",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,                       // MÁS GRANDE
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Introduce tu correo asociado a tu cuenta de CalcNow",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 45),

                    /// ------------------ EMAIL ------------------
                    SizedBox(
                      width: 370,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Introduzca su correo electrónico",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),

                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF46899F),
                                  width: 2.7,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF46899F),
                                  width: 3.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// ------------------ PASSWORD ------------------
                    SizedBox(
                      width: 370,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Introduzca su contraseña",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),

                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF46899F),
                                  width: 2.7,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF46899F),
                                  width: 3.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    /// -------- BOTÓN LOGIN --------
                    SizedBox(
                      width: 230,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          "ACCEPT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,          // MÁS GRANDE
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// -------- BOTÓN SIGN UP --------
                    SizedBox(
                      width: 230,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20, // MÁS GRANDE
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 70),

                    /// -------- LOGO + TEXTO CALCNOW --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "CALC",
                          style: TextStyle(
                            fontSize: 33, // MÁS GRANDE
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          "NOW",
                          style: TextStyle(
                            fontSize: 33,
                            color: Color(0xFF46899F),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          'assets/logo_transparente.png',
                          width: 60,   // MÁS GRANDE
                          height: 60,
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
