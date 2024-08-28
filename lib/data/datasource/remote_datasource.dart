import 'package:annar_app/data/exeption.dart';
import 'package:annar_app/data/model/health_data_model.dart';
import 'package:annar_app/data/model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RemoteDataSource {
  late BaseOptions _optionsApi;
  late Dio _client;

  RemoteDataSource({
    required String baseUrl,
    required int connectTimeout,
    required int receiveTimeout,
  }) {
    _optionsApi = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    );

    _client = Dio(_optionsApi);
    _configureInterceptors();
  }

  void _configureInterceptors() {
    addInterceptor(InterceptorsWrapper(
      onRequest: (options, handler) {

        handler.next(options);
        print('on request');
      },
      onResponse: (response, handler) {
        handler.next(response);
        print('on response');
      },
      onError: (error, handler) {
        handler.next(error);
        print('on error');
      },
    ));
  }

  void addInterceptor(Interceptor interceptor) {
    _client.interceptors.add(interceptor);
  }

  Future<LoginModel> login(
      {required String user, required String password}) async {
    final Map<String, dynamic> queryParams = {
      'usuario': user,
      'contrasenia': password
    };

    final apiReponse = await _client
        .get('/login', queryParameters: queryParams)
        .catchError((erorr) {
      throw ServerException();
    });

    if (apiReponse.statusCode == 200) {
      try {
        return LoginModel.fromJson(apiReponse.data);
      } catch (error) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  Future<HealthModel> fetchHealthData() async {
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
  

    final Map<String, dynamic> data = {
      'token': token,
    };

    final apiReponse =
        await _client.post('/obtenerData', data: data).catchError((erorr) {
      throw ServerException();
    });

    if (apiReponse.statusCode == 200) {
      try {
        return HealthModel.fromJson(apiReponse.data);
      } catch (error) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
