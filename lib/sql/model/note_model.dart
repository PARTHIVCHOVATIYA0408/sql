class NoteModel {
  final int? id;
  final int age;
  final String title;
  final String description;
  final String email;

  NoteModel({
    this.id,
    required this.age,
    required this.title,
    required this.description,
    required this.email,
  });

  NoteModel.fromMap(Map<String, dynamic> nt)
      : id = nt['id'],
        age = nt['age'],
        title = nt['title'],
        description = nt['description'],
        email = nt['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'age': age,
      'title': title,
      'description': description,
      'email': email,
    };
  }
}
