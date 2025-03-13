import 'package:flutter/material.dart';
import 'package:my_personal_alquran/data/models/surat_detail_model.dart'; // ✅ Gunakan SuratDetailModel
import 'package:my_personal_alquran/domain/repositories/quran_repository.dart';

class SuratDetailViewModel extends ChangeNotifier {
  final QuranRepository _quranRepository;

  bool isLoading = false;
  String? errorMessage;
  SuratDetailModel? surat; // ⬅ Ubah tipe dari SuratModel ke SuratDetailModel

  SuratDetailViewModel(this._quranRepository);

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> fetchSuratDetail(int suratNumber) async {
    setLoading(true);

    try {
      surat = await _quranRepository.fetchSuratDetail(suratNumber);
      errorMessage = null; // ✅ Reset error jika berhasil
    } catch (e) {
      errorMessage = "Gagal mengambil detail Surat!";
      debugPrint('❌ Error fetching Surat Detail: $e');
    }

    setLoading(false);
  }
}
