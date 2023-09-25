import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/view/edit_screen/widget/category_field.dart';
import 'package:taskify/view/edit_screen/widget/date_field.dart';
import 'package:taskify/view/edit_screen/widget/onupdate_buttonclicked.dart';
import 'package:taskify/view/edit_screen/widget/task_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final taskProvider = Provider.of<AddTaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: const Center(
            child: Text(
          "Add Task",
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
          child: Column(
            children: [
              cHeight50,
              EditTaskField(context: context, taskProvider: taskProvider,),
              cHeight50,
               EditCategoryField(taskProvider: taskProvider,),
              cHeight50,
              editDate(),
              cHeight70,
              OnUpdateButtonClicked(taskProvider: taskProvider)
            ],
          ),
        ),
      ),
    );
  }
}