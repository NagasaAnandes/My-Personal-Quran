import 'package:my_personal_alquran/data/datasource/remote/api_services.dart';
import 'package:my_personal_alquran/data/models/surat_detail_model.dart';
import 'package:my_personal_alquran/data/models/surat_model.dart';

class QuranRepository {
  final ApiService apiService;

  QuranRepository(this.apiService);

  /// Fetch daftar surah (QuranPage)
  Future<List<SuratModel>> getAllSurats() async {
    try {
      return await apiService.getAllSurats();
    } catch (e) {
      print("❌ Error in getAllSurahs: $e");
      return [];
    }
  }

  /// Fetch detail surah + ayat (SurahDetailPage)
  Future<SuratDetailModel?> fetchSuratDetail(int suratNumber) async {
    try {
      return await apiService.getSurat(suratNumber);
    } catch (e) {
      print("❌ Error fetching Surah Detail: $e");
      return null;
    }
  }
}
