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
    ultimo = int.tryParse(map['Último']) ?? 0;
    variabilidad = map['Var.'].toDouble();
    apertura = int.tryParse(map['Apertura'].toString()) ?? 0;
    maximo = int.tryParse(map['Máximo'].toString()) ?? 0;
    minimo = int.tryParse(map['Mínimo'].toString()) ?? 0;
    volumen = int.tryParse(map['Volumen'].toString()) ?? 0;
    hora = map['Hora'].toString();
    grafico = map['Gráfico'] != null ? map['Gráfico'].toString() : '';
    ;
  }
}
