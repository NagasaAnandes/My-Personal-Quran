import 'package:flutter/material.dart';
import 'package:my_personal_alquran/data/models/surat_model.dart';
import 'package:my_personal_alquran/presentation/widgets/quran/surat_list_item.dart';

class SuratList extends StatelessWidget {
  final List<SuratModel> surats;

  const SuratList({required this.surats, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: surats.length,
      itemBuilder: (context, index) {
        final surat = surats[index];
        return SuratListItem(surat: surat);
      },
    );
  }
}
