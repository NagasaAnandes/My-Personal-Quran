import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/data/models/surat_detail_model.dart';

class SuratDetailHeader extends StatelessWidget {
  final SuratDetailModel surat;

  const SuratDetailHeader({Key? key, required this.surat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      color: AppColors.primary,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            surat.namaLatin,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${surat.tempatTurun} • ${surat.jumlahAyat} Ayat • ${surat.arti}',
            style: TextStyle(color: AppColors.background),
          ),
          SizedBox(height: 16),
          surat.nomor != 9
              ? Text(
                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
