import 'package:flutter/material.dart';
import 'package:taskify/model/task_model.dart';
import 'package:taskify/services/firebase/firebase_services.dart';

class AddTaskProvider extends ChangeNotifier {
  final TextEditingController taskController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  DateTime date = DateTime.now();
  List<TaskModel> tasks = [];

  void changeDateValue(DateTime value) {
    date = value;
    notifyListeners();
  }

  ////////////Crud Functions//////////////

  final FirebaseServices firebaseServices = FirebaseServices();

  Future<void> fetchTasks() async {
    tasks = await firebaseServices.fetchTasks();
    notifyListeners();
  }

  void addTask() async {
    final _task = TaskModel(
      id: "",
      task: taskController.text,
      category: categoryController.text,
      date: date,
    );
    firebaseServices.addTask(_task);
    await fetchTasks();
    notifyListeners();
  }

  Future<void> deleteTask(String docId) async {
    firebaseServices.deleteTask(docId);
    await fetchTasks();
    notifyListeners();
  }

  void updateTask(String docId) async {
    final task = TaskModel(
        id: docId,
        task: taskController.text,
        category: categoryController.text,
        date: date);
    firebaseServices.updateTask(task);
    await fetchTasks();
    notifyListeners();
  }
}
