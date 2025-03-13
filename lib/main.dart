import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/views/main_page.dart';
import 'presentation/viewmodels/main_viewmodel.dart';
import 'presentation/viewmodels/quran_viewmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan binding Flutter sudah siap
  await Hive.initFlutter(); // Inisialisasi Hive
  await Hive.openBox('quran_data'); // Buka database lokal

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ChangeNotifierProvider(
          create: (_) => QuranViewModel(QuranRepository()),
        ),
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
