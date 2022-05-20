class ImagineModel {
  late String mes;
  late int ultimo;
  late double variabilidad;
  late int apertura;
  late int maximo;
  late int minimo;
  late int volumen;
  late String hora;
  late String grafico;

  ImagineModel({
    required this.mes,
    required this.ultimo,
    required this.variabilidad,
    required this.apertura,
    required this.maximo,
    required this.minimo,
    required this.volumen,
    required this.hora,
    required this.grafico,
  });

  ImagineModel.fromMap(Map<String, dynamic> map) {
    mes = map['Mes'] != null ? map['Mes'].toString() : '';
    ultimo = int.parse(map['Último'].toString().replaceAll('s', ''));
    variabilidad = map['Var.'].toDouble();
    apertura = int.parse(map['Apertura'].toString());
    maximo = int.parse(map['Máximo'].toString());
    minimo = int.parse(map['Mínimo'].toString());
    volumen = int.parse(map['Volumen'].toString());
    hora = map['Hora'].toString();
    grafico = map['Gráfico'] != null ? map['Gráfico'].toString() : '';
    ;
  }
}
