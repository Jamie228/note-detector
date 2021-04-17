class Note {
  final int id;
  final String name;
  final String displayName;
  final String imagePath;
  final String description;

  Note(
      {this.id, this.name, this.description, this.displayName, this.imagePath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'displayName': displayName,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
