class Items {
  final int id;
  final int listID;
  final String title;
  final String? description;

  const Items({
    required this.id,
    required this.listID,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id: ': id,
      'listID: ': listID,
      'title: ': title,
      'description: ': description
    };
  }
}
