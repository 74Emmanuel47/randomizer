class Listas {
  final int? id;
  final String title;
  final String? description;

  const Listas({
    this.id,
    required this.title,
    this.description = "HOLA",
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}