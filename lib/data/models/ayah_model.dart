class AyahModel {
  final int number;
  final String text;
  final String translation;

  AyahModel({
    required this.number,
    required this.text,
    required this.translation,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['number'],
      text: json['text'],
      translation: json['translation'] ?? '',
    );
  }
}
