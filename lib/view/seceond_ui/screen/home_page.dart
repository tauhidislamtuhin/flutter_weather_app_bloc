import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_bloc/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_bloc/view/seceond_ui/widghts/day_weather_list.dart';
import 'package:flutter_weather_app_bloc/view/seceond_ui/widghts/hourly_weather_list.dart';
import 'package:flutter_weather_app_bloc/view/seceond_ui/widghts/today_custom_text.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import '../../../data/model/weather_model.dart';
import '../widghts/weather_type.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherBloc>().add(FetchWeather("auto:ip"));
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            height: 40,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: "Enter city name",
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  context.read<WeatherBloc>().add(FetchWeather(value.trim()));
                }
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<WeatherBloc>().add(FetchWeather("auto:ip"));
              },
              icon: const Icon(Icons.location_on_outlined, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              final location = state.weatherModel.location!.name.toString();
              final date = DateFormat.yMMMMEEEEd().format(DateTime.parse(
                  state.weatherModel.current!.lastUpdated.toString()));
              return Column(
                children: [
                  Stack(
                    children: [
                      WeatherBg(
                          weatherType: getWeatherType(
                              state.weatherModel.current?.condition?.text,
                              state.weatherModel.current?.isDay),
                          width: MediaQuery.of(context).size.width,
                          height: 310),
                      Container(
                        width: double.infinity,
                        height: 310,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "$location\n$date",
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white10),
                                  child: Image.network(
                                      "https:${state.weatherModel.current?.condition?.icon ?? ""}"),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.weatherModel.current?.tempC
                                                  ?.round()
                                                  .toString() ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.pink,
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "o",
                                          style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      state.weatherModel.current?.condition
                                              ?.text ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TodayCustomText(
                                            text: "Feel Like",
                                            value: state.weatherModel.current
                                                    ?.feelslikeC
                                                    ?.round()
                                                    .toString() ??
                                                ""),
                                        TodayCustomText(
                                            text: "Wind",
                                            value:
                                                "${state.weatherModel.current?.windKph?.round().toString()} km/h" ??
                                                    "")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TodayCustomText(
                                            text: "Humidity",
                                            value:
                                                "${state.weatherModel.current?.humidity?.round().toString()}%"),
                                        TodayCustomText(
                                            text: "Visibility",
                                            value:
                                                "${state.weatherModel.current?.visKm?.round().toString()} km")
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Weather By Hours",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        Hour? hour = state.weatherModel?.forecast
                            ?.forecastday?[0].hour?[index];

                        return HourlyWeatherList(
                          hour: hour,
                        );
                      },
                      itemCount: state.weatherModel?.forecast?.forecastday?[0]
                              .hour?.length ??
                          0,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Next 7 Days Weather",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DayWeatherList(
                        forecastday:
                            state.weatherModel?.forecast?.forecastday?[index],
                      );
                    },
                    itemCount:
                        state.weatherModel?.forecast?.forecastday?.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  ))
                ],
              );
            } else if (state is WeatherError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
