class ToDoModel {
  String description = '';
  String excuse = '';
  String mood = '';
  String state = '';

  ToDoModel({required this.description, required this.excuse, required this.mood, required this.state});

  @override
  String toString() {
    return '$description $excuse $mood $state';
  }
}
