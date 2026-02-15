import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'splash_screen.dart';
import 'allah_names_page.dart';
import 'doa_page.dart';
import 'prayer_times_page.dart';
import 'ramadan_page.dart';
import 'zakat_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  bool _showSplash = true;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = _themeMode == ThemeMode.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      // Define routes for easy navigation if needed, though we primarily use CounterPage logic
      routes: {
        '/suras': (context) => const ShortSuraPage(), // Assuming you have/will have this page
      },
      home: _showSplash 
          ? SplashScreen(
              isDarkMode: isDarkMode, 
              onFinished: () {
                setState(() {
                  _showSplash = false;
                });
              },
            )
          : CounterPage(
              isDarkMode: isDarkMode,
              onToggleTheme: _toggleTheme,
            ),
    );
  }
}

// Minimal placeholder if ShortSuraPage is missing from files but used in routes
class ShortSuraPage extends StatelessWidget {
  const ShortSuraPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Short Sura Page Content")));
  }
}
