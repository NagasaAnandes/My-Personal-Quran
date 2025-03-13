import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/data/models/surat_model.dart';
import 'package:my_personal_alquran/presentation/views/surat_detail_page.dart';

class SuratListItem extends StatelessWidget {
  final SuratModel surat;

  const SuratListItem({required this.surat, super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuratDetailPage(suratNumber: surat.nomor),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Nomor surat dalam lingkaran
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 2),
              ),
              alignment: Alignment.center,
              child: Text(
                '${surat.nomor}',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 16),

            // Nama surat & subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surat.namaLatin,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.foreground,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    surat.arti.toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.foreground.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${surat.jumlahAyat} Ayat | ${surat.tempatTurun.toUpperCase()}',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.foreground.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            // Nama arab
            Text(
              surat.nama,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
