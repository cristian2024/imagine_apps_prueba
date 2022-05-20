import 'package:flutter/material.dart';
import 'package:imagine_apps_prueba/Ui/components/card.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';
import 'package:imagine_apps_prueba/services/imagine_service.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ImagineService service = ImagineService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Imagine apps prueba',
          ),
        ),
        body: StreamBuilder<List<ImagineModel>>(
          stream: service.imagines(),
          builder: (context, snapshot) {
            return Cards(
              imagines: snapshot.data,
            );
          },
        ),
      ),
    );
  }
}



