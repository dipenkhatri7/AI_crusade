import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/views/pages/home.dart';
import 'services/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalVariable(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vāc',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Urbanist',
        ),
        onGenerateRoute: (settings) => router.generateRoute(settings),
        home: const Home());
  }
}
