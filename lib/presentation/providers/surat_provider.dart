import 'package:flutter/material.dart';
import 'package:my_personal_alquran/data/datasource/remote/api_services.dart';
import '../../data/models/surat_detail_model.dart';

class SuratProvider with ChangeNotifier {
  final ApiService apiService;

  SuratProvider({required this.apiService});

  SuratDetailModel?
  surat; // ⬅ Ubah tipe data dari SuratModel ke SuratDetailModel
  bool isLoading = false;

  Future<void> fetchSurat(int suratNumber) async {
    isLoading = true;
    notifyListeners();

    try {
      surat = await apiService.getSurat(
        suratNumber,
      ); // ⬅ Sesuai dengan APIService yang mengembalikan SuratDetailModel
    } catch (e) {
      print("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
