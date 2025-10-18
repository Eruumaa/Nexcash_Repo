import 'package:flutter/material.dart';
import '../widgets/button_home.dart';

class KartuProfile extends StatelessWidget {
  final String bagian;
  final String judul;
  final String gambar;
  const KartuProfile({
    super.key,
    required this.bagian,
    required this.judul,
    required this.gambar
    });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(gambar),
                    Text(
                      bagian,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 25, 24, 59),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      judul,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 25, 24, 59),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
