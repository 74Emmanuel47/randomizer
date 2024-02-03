// ignore_for_file: file_names

class Items {
  final int? id;
  final int listID;
  final String title;
  final String? description;

  const Items({
    this.id,
    required this.listID,
    required this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {'listID ': listID, 'title ': title, 'description ': description};
  }
}
