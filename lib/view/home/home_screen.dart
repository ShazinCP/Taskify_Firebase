import 'package:flutter/material.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/view/home/widget/tasklist.dart';
import 'package:taskify/view/home/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: cBlackWithOpacity,
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: appbarColor,
            title: const Center(
              child: Text(
                "To Do",
                style: TextStyle(
                    color: cWhiteColor,
                    fontFamily: "f",
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: floatingActionButtonWidget(context),
      body: Column(
        children: [
          SizedBox(
            height: 230,
            width: double.infinity,
            child: Image.asset(
                "assets/todo-task-list-check-time-flat-line-filled-icon-beautiful-logo-button-over-yellow-background-for-ui-and-ux-website-or-mobile-application-free-vector.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pending Tasks",
                  style: TextStyle(
                    color: cWhiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: cBlackColor,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.format_list_bulleted_rounded,
                    color: cWhiteColor,
                    size: 26,
                  ),
                )
              ],
            ),
          ),
          TaskList(size: size),
        ],
      ),
    );
  }
}
