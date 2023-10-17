import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/view/edit_screen/widget/category_field.dart';
import 'package:taskify/view/edit_screen/widget/onupdate_buttonclicked.dart';
import 'package:taskify/view/edit_screen/widget/task_field.dart';

class EditScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  EditScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<AddTaskProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    taskProvider.taskController.text = args['task'];
    taskProvider.categoryController.text = args['category'];
    taskProvider.date = args['date'];
    final docId = args['id'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: const Center(
            child: Text(
          "Edit Task",
          style: TextStyle(fontWeight: FontWeight.w600, color: cWhiteColor),
        )),
        actions: const [
          Icon(
            Icons.abc,
            color: appbarColor,
            size: 40,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                cHeight50,
                EditTaskField(context: context, taskProvider: taskProvider),
                cHeight50,
                EditCategoryField(taskProvider: taskProvider),
                cHeight50,
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: cRadius10,
                    border: Border.all(
                      width: 2,
                      color: cWhiteColor,
                    ),
                  ),
                  height: 50,
                  width: 350,
                  child: Consumer<AddTaskProvider>(
                    builder: (context, value, child) {
                      return TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: value.date,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100));
                          // ignore: unrelated_type_equality_checks
                          if (newDate == null) {
                            return;
                          } else {
                            value.date = newDate;
                          }
                        },
                        child: Text(
                          'Date : ${value.date.year}/${value.date.month}/${value.date.day}',
                          style: const TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.normal,
                              color: cBlackColor),
                        ),
                      );
                    },
                  ),
                ),
                cHeight70,
                OnUpdateButtonClicked(
                  taskProvider: taskProvider,
                  formkey: formkey,
                  docId: docId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
