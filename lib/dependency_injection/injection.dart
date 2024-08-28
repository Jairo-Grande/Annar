import 'package:annar_app/data/datasource/remote_datasource.dart';
import 'package:annar_app/data/model/app_config_model.dart';
import 'package:annar_app/data/repositories/annar_repository_impl.dart';
import 'package:annar_app/domain/entities/app_config_entity.dart';
import 'package:annar_app/domain/repositories/annar_repository.dart';
import 'package:annar_app/domain/use_cases/get_annar_api.dart';
import 'package:annar_app/ui/features/home/bloc/home_bloc.dart';
import 'package:annar_app/ui/features/login/bloc/login_bloc.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:yaml/yaml.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //Configuration
  final configFile = await rootBundle.loadString('lib/config/app_config.yaml');
  final YamlMap yamlMap = loadYaml(configFile);
  late AppConfig appConfig = AppConfigModel.fromMap(yamlMap);


//initialize use-cases

locator.registerLazySingleton(() => GetAnnarApi(locator()));




  //initilize blocs
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => HomeBloc(locator()));

//initialice annar repository
  locator.registerLazySingleton<AnnarRepository>(
    () => AnnarRepositoryImpl(remoteDataSource: locator()),
  );

//initialice remote datasouce
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(
        baseUrl: appConfig.baseUrl,
        connectTimeout: appConfig.connectTimeOut,
        receiveTimeout: appConfig.receiveTimeOut,
      ));
}
