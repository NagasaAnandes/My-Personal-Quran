class AyatModel {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Map<String, String> audio;

  AyatModel({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory AyatModel.fromJson(Map<String, dynamic> json) {
    return AyatModel(
      nomorAyat: json["nomorAyat"],
      teksArab: json["teksArab"],
      teksLatin: json["teksLatin"],
      teksIndonesia: json["teksIndonesia"],
      audio: Map<String, String>.from(json["audio"]),
    );
  }
}
