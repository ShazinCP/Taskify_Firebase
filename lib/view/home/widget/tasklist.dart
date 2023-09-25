import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/controller/internet_connectivity_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/model/task_model.dart';

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
              final TaskModel toDoTask = value.tasks[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                          color: cWhiteColor, blurRadius: 2, spreadRadius: 2)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: appbarColor,
                          radius: 30,
                          child: Text(
                            toDoTask.category.toString(),
                            style: const TextStyle(
                              color: cWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(
                                      1.5, 1.5),
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
                            toDoTask.task.toString(),
                            style: const TextStyle(
                                color: cBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21),
                          ),
                          Text(
                            toDoTask.date.toString(),
                            style: const TextStyle(
                                color: cBlackColor,
                                fontWeight: FontWeight.bold),
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
                                      'name': toDoTask.task,
                                      'phone': toDoTask.category.toString(),
                                      'group': toDoTask.date,
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
