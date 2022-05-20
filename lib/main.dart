import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagine_apps_prueba/Ui/screens/imagines_screen.dart';
import 'package:imagine_apps_prueba/bloc/imagines/imagines_cubit.dart';

void main() {
  // runApp(MyApp());
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: BlocProvider(
        create: (context) => ImaginesCubit()..loadInitialData(),
        child: MyApp(),
      ),
    ),
  );
}
