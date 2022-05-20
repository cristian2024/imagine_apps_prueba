import 'package:flutter/material.dart';
import 'package:imagine_apps_prueba/Ui/components/dialog_imagine.dart';
import 'package:imagine_apps_prueba/Ui/components/indicator.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';

class Cards extends StatelessWidget {
  final List<ImagineModel>? imagines;
  const Cards({
    Key? key,
    required this.imagines,
  }) : super(key: key);

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
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogImagine(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            value: imagines![index].apertura /
                                imagines![index].maximo,
                          ),
                          Indicator(
                            title: 'Maximo',
                            value: imagines![index].maximo /
                                imagines![index].maximo,
                          ),
                          Indicator(
                            title: "Minimo",
                            value: imagines![index].minimo /
                                imagines![index].maximo,
                          ),
                          Indicator(
                            title: "Ultimo",
                            value: imagines![index].ultimo /
                                imagines![index].maximo,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Card(imagine: imagines![index]),
            );
          },
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.imagine,
  }) : super(key: key);

  final ImagineModel imagine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      // margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(30),
      child: Text(
        "Estipulado el ${imagine.mes} a las  ${imagine.hora}",
      ),
    );
  }
}
