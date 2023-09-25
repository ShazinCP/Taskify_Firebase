import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? task;
  String? category;
  DateTime? date;
  String? id;

  TaskModel({
    required this.task,
    required this.category,
    required this.date,
    required this.id,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map, String id) {
    // Use toDate() to convert Timestamp to DateTime
    DateTime? dateTime = map['date']?.toDate();
    
    return TaskModel(
      id: id,
      task: map['task'] ?? '',
      category: map['category'] ?? '',
      date: dateTime, // Assign the converted DateTime
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'category': category,
      // If you need to convert DateTime back to Timestamp when saving to Firestore, use the following:
      'date': date != null ? Timestamp.fromDate(date!) : null,
    };
  }
}