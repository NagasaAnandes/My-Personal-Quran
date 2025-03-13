import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranService {
  final String baseUrl = 'https://api.alquran.cloud/v1';

  // Ambil semua surah
  Future<Map<String, dynamic>> getAllSurahs() async {
    final response = await http.get(Uri.parse('$baseUrl/surah'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load surahs');
    }
  }

  // ✅ Ambil detail surah berdasarkan nomor
  Future<Map<String, dynamic>> getSurah(int surahNumber) async {
    final response = await http.get(Uri.parse('$baseUrl/surah/$surahNumber'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load surah detail');
    }
  }

  // Ambil detail surah dengan terjemahan
  Future<Map<String, dynamic>> getSurahWithTranslation(int surahNumber) async {
    final response = await http.get(
      Uri.parse(
        'https://api.alquran.cloud/v1/surah/$surahNumber/id.indonesian',
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load surah translation');
    }
  }
}
