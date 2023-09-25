import 'package:flutter/material.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';

class AddCategoryField extends StatelessWidget {
  const AddCategoryField({
    super.key, required this.taskProvider,
  });
  
  final AddTaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: TextFormField(
          controller: taskProvider.categoryController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: "Add Category",
            labelStyle: const TextStyle(fontSize: 17, color: cBlackColor),
            border: OutlineInputBorder(
              borderRadius: cRadius10,
              borderSide: const BorderSide(width: 2, color: cWhiteColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: cRadius10,
              borderSide: const BorderSide(width: 2, color: cWhiteColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: cRadius15,
                borderSide: const BorderSide(width: 2, color: cWhiteColor)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter task";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}

