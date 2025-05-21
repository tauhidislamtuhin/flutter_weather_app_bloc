part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather(this.city);
}