// import 'package:flutter/material.dart';
// import 'package:my_personal_alquran/data/models/surah_model.dart';
// import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';

// class SurahDetailViewModel extends ChangeNotifier {
//   final QuranRepository _quranRepository = QuranRepository();
//   bool isLoading = false;
//   SurahModel? surah;

//   Future<void> fetchSurahDetail(int surahNumber) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       surah = await _quranRepository.fetchSurahDetail(surahNumber);
//     } catch (e) {
//       print('Error: $e');
//     }

//     isLoading = false;
//     notifyListeners();
//   }
// }
