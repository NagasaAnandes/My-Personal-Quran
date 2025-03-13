import 'package:flutter/material.dart';
import 'package:my_personal_alquran/presentation/widgets/quran/ayat_card.dart';
import 'package:my_personal_alquran/presentation/widgets/quran/surat_detail_action.dart';
import 'package:my_personal_alquran/presentation/widgets/quran/surat_detail_header.dart';
import 'package:provider/provider.dart';
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/presentation/viewmodels/quran_viewmodel.dart';

class SuratDetailPage extends StatefulWidget {
  final int suratNumber;

  const SuratDetailPage({Key? key, required this.suratNumber})
    : super(key: key);

  @override
  _SuratDetailPageState createState() => _SuratDetailPageState();
}

class _SuratDetailPageState extends State<SuratDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuranViewModel>(
        context,
        listen: false,
      ).getSuratDetail(widget.suratNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ), // Ganti icon di sini
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Surat', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<QuranViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final surat = viewModel.suratDetail;
          if (surat == null) {
            return Center(child: Text('Gagal memuat data surat.'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                SuratDetailHeader(surat: surat),
                SizedBox(height: 16),
                SuratDetailActions(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: surat.ayat.length,
                    itemBuilder: (context, index) {
                      final ayat = surat.ayat[index];
                      return AyatCard(ayat: ayat);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
