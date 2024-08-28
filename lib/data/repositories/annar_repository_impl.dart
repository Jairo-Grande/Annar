import 'dart:io';

import 'package:annar_app/data/datasource/remote_datasource.dart';
import 'package:annar_app/data/exeption.dart';
import 'package:annar_app/data/failure.dart';
import 'package:annar_app/data/model/health_data_model.dart';
import 'package:annar_app/data/model/login_model.dart';
import 'package:annar_app/domain/repositories/annar_repository.dart';
import 'package:dartz/dartz.dart';

class AnnarRepositoryImpl implements AnnarRepository {
  final RemoteDataSource remoteDataSource;
  AnnarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> login(
      {String? user, String? password}) async {
    try {
      final result =
          await remoteDataSource.login(user: user!, password: password!);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ServerFailure('Conection Failure'));
    }
  }

  @override
  Future<Either<Failure, HealthModel>> fetchHealthData() async {
    try {
      final result = await remoteDataSource.fetchHealthData();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ServerFailure('Conection Failure'));
    }
  }
}
