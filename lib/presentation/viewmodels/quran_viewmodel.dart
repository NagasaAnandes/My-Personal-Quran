import 'package:flutter/material.dart';
import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';
import 'package:my_personal_alquran/data/models/surat_model.dart';
import 'package:my_personal_alquran/data/models/surat_detail_model.dart'; // ✅ Import model detail surat

class QuranViewModel extends ChangeNotifier {
  final QuranRepository _quranRepository;

  List<SuratModel> surats = [];
  SuratDetailModel?
  suratDetail; // ⬅ Ubah tipe data dari SuratModel ke SuratDetailModel
  bool isLoading = false;
  String? errorMessage;

  QuranViewModel(this._quranRepository) {
    fetchAllSurats();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> fetchAllSurats() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _quranRepository.getAllSurats();
      print("✅ Response API: $response"); // Debugging response

      if (response.isNotEmpty) {
        // ✅ Pastikan response tidak kosong
        surats = response;
        errorMessage = null;
      } else {
        errorMessage = "Data tidak tersedia!";
        print("❌ Response dari API kosong!");
      }
    } catch (e) {
      errorMessage = "Gagal mengambil daftar Surat!";
      print("❌ Error fetching Surat List: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getSuratDetail(int suratNumber) async {
    isLoading = true;
    notifyListeners();
    try {
      suratDetail = await _quranRepository.fetchSuratDetail(suratNumber);
    } catch (e) {
      print('❌ Error fetching Surat Detail: $e');
      suratDetail = null;
    }
    isLoading = false;
    notifyListeners();
  }
}
