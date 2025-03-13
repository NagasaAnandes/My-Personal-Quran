import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/presentation/views/surah_detail_page.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quran_viewmodel.dart';

class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Al-Quran', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<QuranViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.surahs.isEmpty) {
            return Center(child: Text('Data Al-Quran belum tersedia.'));
          }
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: viewModel.surahs.length,
            itemBuilder: (context, index) {
              final surah = viewModel.surahs[index];
              return Column(
                children: [
                  ListTile(
                    tileColor: AppColors.background,
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            color: AppColors.secondary,
                            size: 50,
                          ),
                          Text(
                            '${surah.number}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      surah.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                    subtitle: Text(
                      '${surah.translation} \u2022 ${surah.ayahCount} Verses \u2022 ${surah.revelation}',
                      style: TextStyle(color: AppColors.foreground),
                    ),
                    trailing: Text(
                      surah.arabic,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SurahDetailPage(surahNumber: surah.number),
                        ),
                      );
                    },
                  ),
                  if (index != viewModel.surahs.length - 1) Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
