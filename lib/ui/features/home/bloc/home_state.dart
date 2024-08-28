part of 'home_bloc.dart';

class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class FetchDataLoading extends HomeState {}

class FetchDataSuccess extends HomeState {
  HealthModel healthData;
  FetchDataSuccess({required this.healthData});
}

class FetchDataFailure extends HomeState {
  final String error;

  const FetchDataFailure(this.error);
}
