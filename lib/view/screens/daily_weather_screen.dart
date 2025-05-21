import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_card.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_text.dart';
import 'package:flutter_weather_app_bloc/view/widghts/daily_weather_item.dart';
import 'package:intl/intl.dart';

import '../../bloc/weather_bloc.dart';
import '../widghts/main_text.dart';

class DailyWeatherScreen extends StatelessWidget {
  const DailyWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final int? day = state.weatherModel.forecast?.forecastday?.length;
          final d = day! - 1;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                      text: state.weatherModel.location?.name ?? "",
                      maxTem:
                          "${state.weatherModel.forecast?.forecastday?[0].day?.maxtempC?.round()}",
                      minTem:
                          "${state.weatherModel.forecast?.forecastday?[0].day?.mintempC?.round()}"),
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomText(
                    text: " 7-Days Forecasts",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    child: ListView.builder(
                      itemCount: d ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DailyWeatherItem(
                          forecastday: state
                              .weatherModel.forecast?.forecastday?[index + 1],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xff1D2549),
                          Color(0xff8042A5),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: "AIR QUALITY",
                              fontSize: 20,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomText(
                          text: "3-Low Health Risk",
                          fontSize: 28,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 5,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: <Color>[
                                Color(0xff1a1f35),
                                Color(0xff953dca),
                              ],
                              tileMode: TileMode.mirror,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "See More",
                              fontSize: 20,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(topText: "SUNRISE",
                          centerText: state.weatherModel.forecast!.forecastday?[0].astro?.sunrise.toString() ?? "",
                          bottomText: "Sunset : ${state.weatherModel.forecast!.forecastday?[0].astro?.sunset.toString()}"),
                      CustomCard(topText: "UV INDEX",
                          centerText: state.weatherModel.current!.uv.toString(),
                          bottomText: "Moderate",color: Colors.white,)
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (state is WeatherError) {
          return Center(
            child:
                Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        } else {
          return const SizedBox();
        }
      },
    );
    ;
  }
}
