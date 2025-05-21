import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

WeatherType getWeatherType(weatherBg, day) {
  if (day == 1) {
    if (weatherBg == "Sunny") {
      return WeatherType.sunny;
    } else if (weatherBg == "Overcast") {
      return WeatherType.overcast;
    } else if (weatherBg == "Partly cloudy") {
      return WeatherType.cloudy;
    } else if (weatherBg == "Cloudy") {
      return WeatherType.cloudy;
    } else if (weatherBg == "Clear") {
      return WeatherType.sunny;
    } else if (weatherBg == "Mist") {
      return WeatherType.lightSnow;
    } else if (weatherBg.contains("thunder")) {
      return WeatherType.thunder;
    } else if (weatherBg.contains("showers")) {
      return WeatherType.middleSnow;
    } else if (weatherBg.contains("rain")) {
      return WeatherType.heavyRainy;
    }
  } else {
    if (weatherBg == "Sunny") {
      return WeatherType.sunny;
    } else if (weatherBg == "Overcast") {
      return WeatherType.overcast;
    } else if (weatherBg == "Partly cloudy") {
      return WeatherType.cloudyNight;
    } else if (weatherBg == "Cloudy") {
      return WeatherType.cloudyNight;
    } else if (weatherBg == "Clear") {
      return WeatherType.sunnyNight;
    } else if (weatherBg == "Mist") {
      return WeatherType.lightSnow;
    } else if (weatherBg.contains("thunder")) {
      return WeatherType.thunder;
    } else if (weatherBg.contains("showers")) {
      return WeatherType.middleSnow;
    } else if (weatherBg.contains("rain")) {
      return WeatherType.heavyRainy;
    }
  }
  return WeatherType.middleRainy;
}
