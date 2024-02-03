// ignore_for_file: file_names

class Listas {
  final int? id;
  final String title;
  final String? description;

  const Listas({
    this.id,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description ?? "Que la suerte esté siempre de tu lado...",
    };
  }
}
