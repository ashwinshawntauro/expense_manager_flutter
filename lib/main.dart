import 'package:flutter/material.dart';
import 'package:demo/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purpleAccent);

var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: const Color.fromARGB(255, 7, 48, 109));

void main() {
  runApp(SafeArea(
    child: MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(primaryColor: Colors.amber).copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.secondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      themeMode: ThemeMode.dark,
      home: const Expenses(),
    ),
  ));
}
