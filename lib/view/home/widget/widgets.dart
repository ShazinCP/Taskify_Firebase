import 'package:flutter/material.dart';
import 'package:taskify/helper/colors.dart';

Container floatingActionButtonWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Transform.scale(
      scale: 1.1,
      child: FloatingActionButton(
        backgroundColor: appbarColor,
        onPressed: () {
          Navigator.pushNamed(context, '/AddScreen');
        },
        child: const Icon(Icons.add, color: cWhiteColor, size: 24),
      ),
    ),
  );
}
