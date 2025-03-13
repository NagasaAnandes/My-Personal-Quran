import 'package:flutter/material.dart';
import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';
import 'package:my_personal_alquran/data/models/surah_model.dart';

class QuranViewModel extends ChangeNotifier {
  final QuranRepository _quranRepository;

  List<SurahModel> surahs = [];
  SurahModel? surahDetail;
  bool isLoading = false;

  QuranViewModel(this._quranRepository) {
    fetchAllSurahs();
  }

  Future<void> fetchAllSurahs() async {
    isLoading = true;
    notifyListeners();
    try {
      surahs = await _quranRepository.fetchAllSurahs();
    } catch (e) {
      print('Error fetching Surahs: $e');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchSurahDetail(int surahNumber) async {
    isLoading = true;
    notifyListeners();
    try {
      surahDetail = await _quranRepository.fetchSurahDetail(surahNumber);
    } catch (e) {
      print('Error fetching Surah Detail: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}
