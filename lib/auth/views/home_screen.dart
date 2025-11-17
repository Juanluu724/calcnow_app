import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/6757559/pexels-photo-6757559.jpeg?auto=compress&cs=tinysrgb&h=627&fit=crop&w=1200',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 160), 
              // ↑ MUCHO MÁS BAJO TODO
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// LOGO + TEXTO MUCHO MÁS ABAJO
                  const SizedBox(height: 120),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "CALC",
                        style: TextStyle(
                          fontSize: 58,   // MÁS GRANDE
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "NOW",
                        style: TextStyle(
                          fontSize: 58,   // MÁS GRANDE
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF46899F),
                        ),
                      ),
                      const SizedBox(width: 15),

                      Image.asset(
                        'assets/logo_transparente.png',
                        width: 75,
                        height: 75,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),

                  const SizedBox(height: 110), // MÁS ESPACIO ANTES DE LAS TARJETAS

                  /// TARJETAS MÁS GRANDES Y MUCHO MÁS SEPARADAS
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 90,   // MUCHA SEPARACIÓN
                    runSpacing: 90,
                    children: [
                      _buildCard(
                        title: "Cambio de divisas",
                        description:
                            "Convierte monedas al instante\ncon tasas actualizadas.",
                        onTap: () => Navigator.pushNamed(context, '/divisas'),
                      ),
                      _buildCard(
                        title: "Cálculo de nómina",
                        description:
                            "Calcula tu salario neto de forma\nrápida y precisa.",
                        onTap: () => Navigator.pushNamed(context, '/nomina'),
                      ),
                      _buildCard(
                        title: "Cálculo de hipoteca",
                        description:
                            "Simula tu cuota mensual en\nsegundos.",
                        onTap: () => Navigator.pushNamed(context, '/hipoteca'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 130), // BOTÓN MUCHO MÁS ABAJO

                  /// BOTÓN LOGIN
                  SizedBox(
                    width: 280,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: _HoverCard(
        title: title,
        description: description,
        onTap: onTap,
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const _HoverCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isHovered ? 1.15 : 1.0,
      duration: const Duration(milliseconds: 200),

      child: GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),

          child: Container(
            width: 310,  // ← MÁS ANCHO
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              color: const Color(0xFF083D5D),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: isHovered ? 30 : 15,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,  // MÁS GRANDE
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 35),
                const Icon(
                  Icons.touch_app_outlined,
                  color: Colors.white,
                  size: 36, // MÁS GRANDE
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
