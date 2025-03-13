class SuratModel {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;

  final Map<String, String> audioFull;

  SuratModel({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory SuratModel.fromJson(Map<String, dynamic> json) {
    return SuratModel(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? "",
      namaLatin: json['namaLatin'] ?? "",
      jumlahAyat: json['jumlahAyat'] ?? 0,
      tempatTurun: json['tempatTurun'] ?? "",
      arti: json['arti'] ?? "",
      deskripsi: json['deskripsi'] ?? "",

      audioFull: Map<String, String>.from(json['audioFull'] ?? {}),
    );
  }
}
