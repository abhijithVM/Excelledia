import 'package:excelledia/home/bloc/getimagelist_bloc.dart';
import 'package:excelledia/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GetimagelistBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excelledia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(
        title: 'Excelledia',
      ),
    );
  }
}
