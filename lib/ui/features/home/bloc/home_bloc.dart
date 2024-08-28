import 'package:annar_app/data/model/health_data_model.dart';
import 'package:annar_app/domain/use_cases/get_annar_api.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAnnarApi getAnnarApi;
  HomeBloc(this.getAnnarApi) : super(HomeInitial()) {
    on<FetchData>(_fetchData);
  }

  _fetchData(FetchData event, Emitter emit) async {
    try {
      emit(FetchDataLoading());
      final response = await getAnnarApi.fetchHealthData();
      response.fold((failure) {
        emit(const FetchDataFailure('Error al Obtener la informacion'));
      }, (data) {
        if (data.status == false) {
          emit(const FetchDataFailure('Error al Obtener la informacion'));
        } else {
          emit(FetchDataSuccess(healthData: data));
        }
      });
    } catch (e) {
      emit(const FetchDataFailure('Error al Obtener la informacion'));
    }
  }
}
