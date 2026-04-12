import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_projects/visa/utils/text.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: -150,
            child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1)
            ))),

          Positioned(
            left: -200,
              bottom: -470,
              child: Container(
            height: 600,
            width: 600,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1)
            ))),

          Positioned(
              top: 20,
              left: 15,
              child: Container(
                height: 30,
                child: Image.asset('assets/image/logo.webp'),
          )),

          Positioned(
              top: 58,
              left: 25,
              child: modifiedText(
                  text: "It's where you want to be",
                  color: Colors.grey.shade900,
                  size: 14)),

          Positioned(
            bottom: 40,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1111 2222 3333 5555',
                    style: GoogleFonts.sourceCodePro(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey.shade700
                    ),),

                  Text('SAURAV KUMAR',
                    style: GoogleFonts.sourceCodePro(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.grey.shade700
                  ),),
                ],
              )),

          Positioned(
            top: 20,
              right: 20,
              child: Container(
                height: 40,
                child: Image.asset('assets/image/chip.jpeg')
              ))
        ],
      ),
    );
  }
}
