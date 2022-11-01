class Dict {
  final String word;
  final String mnDef;
  final String enDef;
  final String ipa;
  final String sound;
  final List<String> examples;

  const Dict({
    required this.word,
    required this.mnDef,
    required this.enDef,
    required this.ipa,
    required this.sound,
    required this.examples,
  });

  factory Dict.fromJson(Map<String, dynamic> json) {
    return Dict(
      word: json['word'],
      mnDef: json['mnDef'],
      enDef: json['enDef'],
      ipa: json['ipa'],
      sound: json['sound'],
      examples: json['examples'],
    );
  }
}
