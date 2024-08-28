class Health {
  bool? status;
  List<Datum?>? data;

  Health({
    required this.status,
    required this.data,
  });
}

class Datum {
  String? fecha;
  int? sistolica;
  int? diastolica;

  Datum({
    required this.fecha,
    required this.sistolica,
    required this.diastolica,
  });
}
