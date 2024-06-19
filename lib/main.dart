import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdf_reader/providers/pdf_provider.dart';
import 'package:pdf_reader/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PdfProvider(),
      child: MaterialApp(
        title: 'PDF Reader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
