import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';

class SuratDetailActions extends StatelessWidget {
  const SuratDetailActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: Row(
        children: [
          // Tombol Tafsir (disabled sementara)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Nanti arahkan ke halaman Tafsir
              },
              icon: Icon(Icons.menu_book, color: AppColors.white),
              label: Text("Tafsir"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.primary,
                disabledForegroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          // Tombol Audio (disabled sementara)
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Nanti arahkan ke halaman Tafsir
              },
              icon: Icon(Icons.play_arrow, color: AppColors.white),
              label: Text("Putar Audio"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.black,
                disabledForegroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
