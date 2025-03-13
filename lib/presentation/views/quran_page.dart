import 'package:flutter/material.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/presentation/widgets/quran/surat_list.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quran_viewmodel.dart';

class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Al-Quran',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // ✅ Selector untuk loading state agar UI lebih optimal
          Selector<QuranViewModel, bool>(
            selector: (_, viewModel) => viewModel.isLoading,
            builder: (context, isLoading, _) {
              if (isLoading) {
                return Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return SizedBox.shrink(); // Tidak rebuild bagian list
            },
          ),

          // ✅ Consumer hanya untuk daftar Surat
          Expanded(
            child: Consumer<QuranViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.surats.isEmpty) {
                  return Center(child: Text('Data Al-Quran belum tersedia.'));
                }
                return SuratList(surats: viewModel.surats);
              },
            ),
          ),
        ],
      ),
    );
  }
}
