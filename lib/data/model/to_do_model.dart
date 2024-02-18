class ToDoModel {
  String description = '';
  String excuse = '';
  String mood = '';
  //String state = '';
 double markDoneButtonOpacity;

  ToDoModel({required this.description, required this.excuse, required this.mood, required this.markDoneButtonOpacity});

  @override
  String toString() {
    return '$description $excuse $mood $markDoneButtonOpacity';
  }
}
