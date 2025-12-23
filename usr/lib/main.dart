import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pilots_screen.dart';
import 'screens/wings_screen.dart';
import 'screens/flights_screen.dart';

void main() {
  // In a real app, we would initialize Supabase here.
  // await Supabase.initialize(url: '...', anonKey: '...');
  runApp(const FlightLoggerApp());
}

class FlightLoggerApp extends StatelessWidget {
  const FlightLoggerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Logger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/pilots': (context) => const PilotsScreen(),
        '/wings': (context) => const WingsScreen(),
        '/flights': (context) => const FlightsScreen(),
      },
    );
  }
}
