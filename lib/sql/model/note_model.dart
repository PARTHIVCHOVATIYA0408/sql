class NoteModel {
  final int? id;
  final String title;
  final String description;
  final String email;

  NoteModel({
    this.id,
    required this.title,
    required this.description,
    required this.email,
  });

  NoteModel.fromMap(Map<String, dynamic> nt)
      : id = nt['id'],
        title = nt['title'],
        description = nt['description'],
        email = nt['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'email': email,
    };
  }
}
