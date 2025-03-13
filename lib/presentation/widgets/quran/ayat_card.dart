import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/data/models/ayat_model.dart';

class AyatCard extends StatelessWidget {
  final AyatModel ayat;

  const AyatCard({Key? key, required this.ayat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // stretch biar full lebar
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${ayat.nomorAyat}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              ayat.teksArab,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              ayat.teksLatin,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              ayat.teksIndonesia,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
