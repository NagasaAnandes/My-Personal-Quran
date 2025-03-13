import 'package:my_personal_alquran/data/datasource/remote/quran_services.dart';
import 'package:my_personal_alquran/data/models/surah_model.dart';

class QuranRepository {
  final QuranService _quranService = QuranService();

  Future<List<SurahModel>> fetchAllSurahs() async {
    try {
      final response = await _quranService.getAllSurahs();
      print("API Response: $response"); // Debugging

      if (response.containsKey('data') && response['data'] is List) {
        return (response['data'] as List)
            .map((json) => SurahModel.fromJson(json))
            .toList();
      } else {
        throw Exception("Invalid API Response");
      }
    } catch (e) {
      print("Error in fetchAllSurahs: $e");
      throw Exception("Failed to load Surahs");
    }
  }

  Future<SurahModel> fetchSurahDetail(int surahNumber) async {
    try {
      final response = await _quranService.getSurah(surahNumber);
      print("Surah Detail API Response: $response"); // Debugging

      if (response.containsKey('data')) {
        return SurahModel.fromJson(response['data']);
      } else {
        throw Exception("Invalid API Response");
      }
    } catch (e) {
      print("Error in fetchSurahDetail: $e");
      throw Exception("Failed to load Surah Detail");
    }
  }
}
