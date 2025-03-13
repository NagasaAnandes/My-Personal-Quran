import 'package:my_personal_alquran/data/models/ayat_model.dart';

class SuratDetailModel {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final List<AyatModel> ayat;
  final Map<String, String> audioFull;

  SuratDetailModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.ayat,
    required this.audioFull,
  });

  factory SuratDetailModel.fromJson(Map<String, dynamic> json) {
    return SuratDetailModel(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? "",
      namaLatin: json['namaLatin'] ?? "",
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? "",
      arti: json['arti'] ?? "",
      deskripsi: json['deskripsi'] ?? "",
      ayat:
          (json["ayat"] as List)
              .map((ayat) => AyatModel.fromJson(ayat))
              .toList(),
      audioFull: Map<String, String>.from(json['audioFull'] ?? {}),
    );
  }
}
