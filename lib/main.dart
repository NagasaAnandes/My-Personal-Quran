import 'package:flutter/material.dart';
import 'package:my_personal_alquran/data/datasource/remote/api_services.dart';
import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';
import 'package:my_personal_alquran/presentation/providers/surat_provider.dart';
import 'package:my_personal_alquran/presentation/views/main_page.dart';
import 'package:my_personal_alquran/presentation/viewmodels/main_viewmodel.dart';
import 'package:my_personal_alquran/presentation/viewmodels/quran_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('quran_data');

  final apiService = ApiService(); // ✅ Buat instance ApiService
  final quranRepository = QuranRepository(
    apiService,
  ); // ✅ Pastikan repository menggunakan apiService

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(
          create: (_) => QuranViewModel(quranRepository),
        ), // ✅ Perbaiki
        ChangeNotifierProvider(
          create: (_) => SuratProvider(apiService: apiService),
        ), // ✅ Perbaiki
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}
