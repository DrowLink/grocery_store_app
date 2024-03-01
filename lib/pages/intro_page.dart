import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              bottom: 80.0, left: 80.0, right: 80, top: 160),
          child: Image.asset('lib/images/avocado.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "We deliver groceries at your doorstep",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        const Text(
          "Fresh items everyday",
          style: TextStyle(color: Colors.grey),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child: const Text("Get Started!",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
