import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskify/model/task_model.dart';

class FirebaseServices {
  
  final CollectionReference firebaseTasks =
      FirebaseFirestore.instance.collection('task');

  Future<List<TaskModel>> fetchTasks() async {
    final snapshot = await firebaseTasks.get();
    return snapshot.docs.map((doc) {
      return TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  void addTask(TaskModel task) {
    final data = task.toMap();
    firebaseTasks.add(data);
  }

  void updateTask(TaskModel task) {
    final data = task.toMap();
    firebaseTasks.doc(task.id).update(data);
  }

  void deleteTask(String docId) {
    firebaseTasks.doc(docId).delete();
  }
}
