import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff5D13E7), Color(0xff8249B5)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Text Test ⚠️',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
