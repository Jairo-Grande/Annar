import 'package:annar_app/data/failure.dart';
import 'package:annar_app/data/model/health_data_model.dart';
import 'package:annar_app/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class AnnarRepository {
  Future<Either<Failure, LoginModel>> login({String? user, String? password});
  Future<Either<Failure, HealthModel>> fetchHealthData();
}
