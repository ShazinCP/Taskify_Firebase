import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/controller/addscreen_provider.dart';
import 'package:taskify/helper/colors.dart';
import 'package:taskify/view/add_screen/add_screen.dart';
import 'package:taskify/view/edit_screen/edit_screen.dart';
import 'package:taskify/view/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddTaskProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => InternetConnectivityProvider(),
        // )
      ],
      child: MaterialApp(
        routes: {
            '/HomeScreen': (context) => const HomeScreen(),
            "/AddScreen": (context) => AddScreen(),
            '/EditScreen': (context) => EditScreen()
          },
        debugShowCheckedModeBanner: false,
        title: 'Taskify',
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(backgroundColor: cYellowColor),
          colorScheme: ColorScheme.fromSeed(seedColor: cPurpleColor),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
