import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_personal_alquran/presentation/viewmodels/quran_viewmodel.dart';

class SurahDetailPage extends StatefulWidget {
  final int surahNumber;

  const SurahDetailPage({Key? key, required this.surahNumber})
    : super(key: key);

  @override
  _SurahDetailPageState createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuranViewModel>(
      context,
      listen: false,
    ).fetchSurahDetail(widget.surahNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Surah")),
      body: Consumer<QuranViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final surah = viewModel.surahDetail;
          if (surah == null) {
            return Center(child: Text("Data tidak tersedia"));
          }

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                surah.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "Ayat: ${surah.ayahCount} • ${surah.revelation}",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Divider(),
              ...?surah.ayahs?.map(
                (ayah) => ListTile(
                  title: Text(
                    ayah.text,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Terjemahan: ${ayah.translation}")],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
