import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_generator_app/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const QuotesGeneratorApp());
}

class QuotesGeneratorApp extends StatelessWidget {
  const QuotesGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //changing the default font family of the app 
      //by using google fonts package instead of downloading the font 
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.gemunuLibreTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      home: HomeView(),
    );
  }
}
