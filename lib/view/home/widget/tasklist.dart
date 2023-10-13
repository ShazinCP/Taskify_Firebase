import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/model/task_model.dart';
import 'package:taskify/view/widgets/uppercase.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AddTaskProvider>(
        builder: (context, value, child) {
          if (value.tasks.isEmpty) {
            // Provider.of<InternetConnectivityProvider>(context, listen: false)
            //     .getInternetConnectivity(context);
            value.fetchTasks();
            return const Center(child: Text('No Data Found'));
          }
          return ListView.builder(
            itemCount: value.tasks.length,
            itemBuilder: (context, index) {
              final TaskModel toDoTask = value.tasks.reversed.toList()[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height / 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appbarColor,
                    boxShadow: const [
                      BoxShadow(
                          color: cWhiteColor, blurRadius: 1, spreadRadius: 1)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: backgroundColor,
                          radius: 30,
                          child: Text(
                            toDoTask.category.toString().capitalize(),
                            style: const TextStyle(
                              color: cWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              shadows: [
                                Shadow(
                                  color: cBlackColor,
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            toDoTask.task.toString().capitalize(),
                            style: const TextStyle(
                                color: cBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            toDoTask.date.toString(),
                            style: const TextStyle(
                                color: cBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              //  Navigator.pushNamed(context, '/EditScreen');
                              Navigator.pushNamed(context, '/EditScreen',
                                  arguments: {
                                    'task': toDoTask.task,
                                    'category': toDoTask.category.toString(),
                                    'date': toDoTask.date,
                                    'id': toDoTask.id
                                  });
                            },
                            icon: const Icon(Icons.edit),
                            iconSize: 25,
                            color: cWhiteColor,
                          ),
                          IconButton(
                            onPressed: () {
                              value.deleteTask(toDoTask.id.toString());
                            },
                            icon: const Icon(Icons.delete),
                            iconSize: 25,
                            color: cRedColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
