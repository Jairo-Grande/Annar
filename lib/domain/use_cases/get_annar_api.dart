import 'package:annar_app/data/failure.dart';
import 'package:annar_app/data/model/health_data_model.dart';
import 'package:annar_app/data/model/login_model.dart';
import 'package:annar_app/domain/repositories/annar_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnnarApi {
  final AnnarRepository repository;
  GetAnnarApi(this.repository);

  Future<Either<Failure, LoginModel>> login(String? user, String? password) {
    return repository.login(user: user, password: password);
  }

  Future<Either<Failure, HealthModel>> fetchHealthData() {
    return repository.fetchHealthData();
  }
}
