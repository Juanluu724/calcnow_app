import 'package:flutter/material.dart';
import '../../auth/services/auth_service.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirm = TextEditingController();

  bool _hide1 = true;
  bool _hide2 = true;
  bool loading = false;

  /// ------------------ FUNCIÓN REGISTRAR ------------------
  Future<void> _registrar() async {
    final email = _email.text.trim();
    final pass = _pass.text.trim();
    final confirm = _confirm.text.trim();

    if (email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      _alert("Rellena todos los campos");
      return;
    }

    if (pass != confirm) {
      _alert("Las contraseñas no coinciden");
      return;
    }

    setState(() => loading = true);

    final response = await AuthService.register(email, pass);

    setState(() => loading = false);

    if (response["success"] == true) {
      _alert("Cuenta creada con éxito");
      Navigator.pop(context);
    } else {
      _alert(response["message"] ?? "Error en el registro");
    }
  }

  /// ------------------ ALERTA ------------------
  void _alert(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  /// ------------------ PANTALLA ------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3F8),
      body: SafeArea(
        child: Stack(
          children: [
            /// ICONO HOME
            Positioned(
              top: 25,
              right: 25,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Icon(
                  Icons.home_outlined,
                  size: 40,
                  color: Colors.black87,
                ),
              ),
            ),

            /// CONTENIDO
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 35),

                    const Text(
                      "Regístrate",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Crea tu cuenta de CalcNow",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 50),

                    /// EMAIL
                    _buildLabel("Correo electrónico"),
                    _buildInput(_email, false),

                    const SizedBox(height: 22),

                    /// CONTRASEÑA
                    _buildLabel("Crea una contraseña"),
                    _buildInput(_pass, true, toggle: () {
                      setState(() => _hide1 = !_hide1);
                    }, obscure: _hide1),

                    const SizedBox(height: 22),

                    /// CONFIRMAR CONTRASEÑA
                    _buildLabel("Confirmar contraseña"),
                    _buildInput(_confirm, true, toggle: () {
                      setState(() => _hide2 = !_hide2);
                    }, obscure: _hide2),

                    const SizedBox(height: 45),

                    /// BOTÓN REGISTRAR
                    SizedBox(
                      width: 230,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: loading ? null : _registrar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: loading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 45),

                    /// LOGO + TEXTO
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "CALC",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "NOW",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF46899F),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/logo_transparente.png",
                          width: 55,
                          height: 55,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ----------- LABEL REUTILIZABLE -----------
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// ----------- INPUT REUTILIZABLE -----------
  Widget _buildInput(
    TextEditingController controller,
    bool hasToggle, {
    VoidCallback? toggle,
    bool obscure = false,
  }) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: hasToggle
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black87,
                  ),
                  onPressed: toggle,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
    );
  }
}
