import 'package:flutter/material.dart';

// -------------------- VISTAS --------------------
import 'auth/views/login_screen.dart';
import 'auth/views/register_screen.dart';
import 'auth/views/home_screen.dart';


void main() {
  runApp(const CalcNowApp());
}

class CalcNowApp extends StatelessWidget {
  const CalcNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalcNow',

      // --------- ACTIVAMOS MATERIAL 3 (sin cambiar tu UI actual) ----------
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF46899F),
        scaffoldBackgroundColor: const Color(0xFFEEF3F8),
        fontFamily: 'Poppins',

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

      // ------------- PANTALLA INICIAL (Home) -------------
      home: const HomeScreen(),

      // ------------- SISTEMA DE RUTAS PROFESIONAL -------------
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),

        // Tus pantallas funcionales
        
      },
    );
  }
}
