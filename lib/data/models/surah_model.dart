import 'package:my_personal_alquran/data/models/ayah_model.dart';

class SurahModel {
  final int number;
  final String name;
  final String revelation;
  final int ayahCount;
  final String arabic;
  final String translation;
  final List<AyahModel>? ayahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.revelation,
    required this.ayahCount,
    required this.arabic,
    required this.translation,
    this.ayahs, // Nullable
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'],
      name: json['englishName'],
      revelation: json['revelationType'],
      ayahCount: json['numberOfAyahs'],
      arabic: json['name'],
      translation: json['englishNameTranslation'],
      ayahs:
          json['ayahs'] != null
              ? (json['ayahs'] as List)
                  .map((ayah) => AyahModel.fromJson(ayah))
                  .toList()
              : null, // Tambahkan pengecekan null
    );
  }
}
