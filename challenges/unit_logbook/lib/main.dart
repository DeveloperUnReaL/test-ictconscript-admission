import 'package:flutter/material.dart';
import 'screens/logbook_screen.dart';

void main() {
  runApp(const UnitLogbookApp());
}

class UnitLogbookApp extends StatelessWidget { // Bit useless to have a separate "screens" folder, but its for maintainability and scaling ;)
  const UnitLogbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Logbook',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 151, 171, 86)), // as close to an army green or something :DD
      ),

      home: const LogbookScreen(),
    );
  }
}