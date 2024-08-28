// To parse this JSON data, do
//
//     final health = healthFromJson(jsonString);

import 'dart:convert';

import 'package:annar_app/domain/entities/health_entity.dart';

HealthModel healthFromJson(String str) =>
    HealthModel.fromJson(json.decode(str));

class HealthModel extends Health {
  HealthModel({super.data, super.status});

  factory HealthModel.fromJson(Map<String, dynamic> json) => HealthModel(
        status: json["status"],
        data: List<DatumModel>.from(
            json["data"].map((x) => DatumModel.fromJson(x))),
      );
}

class DatumModel extends Datum {
  DatumModel({super.diastolica, super.fecha, super.sistolica});

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        fecha: json["fecha"],
        sistolica: json["sistolica"],
        diastolica: json["diastolica"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "sistolica": sistolica,
        "diastolica": diastolica,
      };
}
