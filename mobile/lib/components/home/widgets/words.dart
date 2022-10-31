class Words implements Comparable<Words> {
  final String chars;

  const Words(this.chars);

  @override
  int compareTo(Words other) => chars.compareTo(other.chars);
}