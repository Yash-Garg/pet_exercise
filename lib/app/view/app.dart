import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petperfect_exercise/ui/home/view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
