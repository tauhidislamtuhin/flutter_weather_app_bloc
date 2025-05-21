import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app_bloc/data/model/weather_model.dart';
import 'package:flutter_weather_app_bloc/data/services/api_service.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiService apiService;
  WeatherBloc(this.apiService) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try{
        emit(WeatherLoading());
        final WeatherModel weather = await apiService.getWeatherData(event.city);
        emit(WeatherLoaded(weather));

      }catch(e){
        emit(WeatherError(e.toString()));
        print(e.toString());
      }
    });
  }
}
