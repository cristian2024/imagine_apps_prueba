import 'package:flutter/material.dart';
import 'package:imagine_apps_prueba/repository/api/imagine_apps.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';
import 'package:imagine_apps_prueba/services/imagine_service.dart';

void main() {
  ImagineApi api = ImagineApi();
  api.getImagines();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ImagineService service = ImagineService();
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

class Cards extends StatelessWidget {
  List<ImagineModel>? imagines;
  Cards({Key? key, required this.imagines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      child: SizedBox(
        child: ListView.builder(
          itemCount: imagines != null ? imagines!.length : 0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    "Gráfico : ${imagines![index].grafico}",
                  ),
                  Text(
                    "Estipulado el ${imagines![index].mes} a las  ${imagines![index].hora}",
                  ),
                  Text(
                    "Variabilidad : ${imagines![index].variabilidad.toString()}",
                  ),
                  Text(
                    "Volumen : ${imagines![index].volumen.toString()}",
                  ),
                  Indicator(
                    title: 'Apertura',
                    value: imagines![index].apertura / imagines![index].maximo,
                  ),
                  Indicator(
                    title: 'Maximo',
                    value: imagines![index].maximo / imagines![index].maximo,
                  ),
                  Indicator(
                    title: "Minimo",
                    value: imagines![index].minimo / imagines![index].maximo,
                  ),
                  Indicator(
                    title: "Ultimo",
                    value: imagines![index].ultimo / imagines![index].maximo,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  String title;
  double value;
  Indicator({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          LinearProgressIndicator(
            minHeight: 10,
            // valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            value: value,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
