import 'package:annar_app/domain/entities/app_config_entity.dart';
import 'package:yaml/yaml.dart';

class AppConfigModel extends AppConfig {
  AppConfigModel({
    required super.baseUrl,
    required super.connectTimeOut,
    required super.receiveTimeOut,
  });

  factory AppConfigModel.fromMap(YamlMap json) => AppConfigModel(
      baseUrl: json["baseUrl"],
      connectTimeOut: json["connectTimeOut"],
      receiveTimeOut: json["receiveTimeOut"]);
}
