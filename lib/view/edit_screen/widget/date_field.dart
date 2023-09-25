import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/constants/constants.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';

  DateTime date = DateTime.now();

Container editDate() {
    return Container(
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
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100));
              // ignore: unrelated_type_equality_checks
              if (newDate == null) {
                return;
              } else {
                date = newDate;
                // ignore: use_build_context_synchronously
                Provider.of<AddTaskProvider>(context, listen: false)
                    .changeDateValue(date);
              }
            },
            child: Text(
              'Date : ${date.year}/${date.month}/${date.day}',
              style: const TextStyle(
                  fontSize: 16,
                  //fontWeight: FontWeight.normal,
                  color: cBlackColor),
            ),
          );
        },
      ),
    );
  }