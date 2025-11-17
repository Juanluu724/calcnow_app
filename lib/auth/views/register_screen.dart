import 'package:flutter/material.dart';
import '../data/usuarios_local.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;

  void _registrar() {
    final email = _emailController.text.trim();
    final pass = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Rellena todos los campos")));
      return;
    }

    if (pass != confirm) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Las contraseñas no coinciden")));
      return;
    }

    usuarios.add({"email": email, "password": pass});

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Cuenta creada con éxito")));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F8),
      body: SafeArea(
        child: Stack(
          children: [
            /// ---------------- ICONO HOME ----------------
            Positioned(
              top: 25,
              right: 25,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Icon(
                  Icons.home_outlined,
                  size: 40,         // más grande
                  color: Colors.black87,
                ),
              ),
            ),

            /// ---------------- FORMULARIO ----------------
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    /// -------- TITULO --------
                    const Text(
                      "Regístrate",
                      style: TextStyle(
                        fontSize: 40,                // Más grande
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Crea tu cuenta de CalcNow",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 45),

                    /// -------- INPUT: EMAIL --------
                    _buildInput(
                      label: "Dirección de correo electrónico",
                      hint: "nombre@dominio.com",
                      controller: _emailController,
                    ),

                    const SizedBox(height: 22),

                    /// -------- INPUT: CONTRASEÑA --------
                    _buildInput(
                      label: "Crea una contraseña",
                      controller: _passwordController,
                      isPassword: true,
                      obscure: _obscure1,
                      toggle: () => setState(() => _obscure1 = !_obscure1),
                    ),

                    const SizedBox(height: 22),

                    /// -------- INPUT: CONFIRMAR --------
                    _buildInput(
                      label: "Confirmar contraseña",
                      controller: _confirmPasswordController,
                      isPassword: true,
                      obscure: _obscure2,
                      toggle: () => setState(() => _obscure2 = !_obscure2),
                    ),

                    const SizedBox(height: 50),

                    /// -------- BOTÓN --------
                    SizedBox(
                      width: 230,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: _registrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 65),

                    /// -------- CALC NOW + LOGO --------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "CALC",
                          style: TextStyle(
                            fontSize: 33,
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
                          "assets/logo_transparente.png",
                          width: 60,
                          height: 60,       // MÁS GRANDE
                        )
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

  /// ---------------------------------------------------------------
  /// REUSABLE INPUT (para que no tengas código duplicado)
  /// ---------------------------------------------------------------
  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    String? hint,
    bool isPassword = false,
    bool obscure = false,
    VoidCallback? toggle,
  }) {
    return SizedBox(
      width: 370,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: isPassword ? obscure : false,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black87,
                      ),
                      onPressed: toggle,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF46899F),
                  width: 2.7,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF46899F),
                  width: 3.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
