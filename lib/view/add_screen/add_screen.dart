import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/view/add_screen/widget/addtask_field.dart';
import 'package:taskify/view/add_screen/widget/category_field.dart';
import 'package:taskify/view/add_screen/widget/date_field.dart';
import 'package:taskify/view/add_screen/widget/onsave_buttonclicked.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                cHeight50,
                AddTaskField(context: context, taskProvider: taskProvider,),
                cHeight50,
                 AddCategoryField(taskProvider: taskProvider,),
                cHeight50,
                addDate(),
                cHeight70,
                OnSaveButtonClicked(formKey: _formKey, taskProvider: taskProvider)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

