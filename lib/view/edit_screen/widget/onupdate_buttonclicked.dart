import 'package:flutter/material.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';

class OnUpdateButtonClicked extends StatelessWidget {
  const OnUpdateButtonClicked(
      {super.key,
      required this.taskProvider,
      required this.formkey,
      this.docId});

  final docId;
  final AddTaskProvider taskProvider;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formkey.currentState!.validate()) {
          taskProvider.updateTask(docId);
            taskProvider.categoryController.clear();
          taskProvider.taskController.clear();
          Navigator.pop(context);
        }
      },
      child: Container(
        height: 60,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appbarColor,
          borderRadius: cRadius10,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: cWhiteColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Text(
          "Update",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: cBlackColor,
          ),
        ),
      ),
    );
  }
}
