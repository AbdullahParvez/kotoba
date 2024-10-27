
class CardItem{
  final String word;
  final String reading;
  final List<Map<String, dynamic>> sense;

  const CardItem({
    required this.word,
    required this.reading,
    required this.sense,
  });
}