class Listas {
  final int id;
  final String title;
  final String? description;

  const Listas({
    required this.id,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id: ': id,
      'title: ': title,
      'description: ': description,
    };
  }
}
