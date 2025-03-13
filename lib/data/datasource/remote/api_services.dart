// import 'dart:convert';
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'package:my_personal_alquran/core/constants.dart';
import 'package:my_personal_alquran/data/models/surat_detail_model.dart';
import '../../models/surat_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = ApiConstants.baseUrl;

  /// ✅ **Fetch daftar surat (QuranPage)**
  Future<List<SuratModel>> getAllSurats() async {
    try {
      final response = await _dio.get("$baseUrl/surat");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => SuratModel.fromJson(json)).toList();
      }
    } catch (e) {
      print("❌ Error fetching all surats: $e");
    }
    return [];
  }

  // / ✅ **Fetch detail surat + ayat (SuratDetailPage)**
  Future<SuratDetailModel?> getSurat(int suratNumber) async {
    try {
      final response = await _dio.get("$baseUrl/surat/$suratNumber");
      if (response.statusCode == 200) {
        return SuratDetailModel.fromJson(response.data['data']);
      }
    } catch (e) {
      print("❌ Error fetching surat detail: $e");
    }
    return null;
  }
}
