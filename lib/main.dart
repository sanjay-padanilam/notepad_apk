import 'package:flutter/material.dart';

import 'package:notepad_apk/controller/newnotes_Controller.dart';
import 'package:notepad_apk/views/homescreen/homescreen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewnotesController(),
        )
      ],
      child: MaterialApp(
        home: Homescreen(),
      ),
    );
  }
}
