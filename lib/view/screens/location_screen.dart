import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_bloc/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_text.dart';
import 'package:flutter_weather_app_bloc/view/widghts/main_text.dart';
import 'package:intl/intl.dart';
import '../../bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../widghts/hourly_weather.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/cloud.png', height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: state.weatherModel.current?.tempC?.round().toString() ?? "",
                        fontSize: 50,
                      ),
                      const CustomText(text: "o", fontSize: 22)
                    ],
                  ),
                  MainText(text: state.weatherModel.current?.condition?.text ?? "",
                      maxTem: "${state.weatherModel.forecast?.forecastday?[0].day?.maxtempC?.round()}",
                      minTem: "${state.weatherModel.forecast?.forecastday?[0].day?.mintempC?.round()}"),
                  const SizedBox(height: 20),
                  Image.asset('assets/images/house.png', height: 200),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(text: "Today"),
                              CustomText(
                                text: DateFormat.MMMMd().format(
                                  DateTime.parse(state.weatherModel.forecast?.forecastday?[0].date ?? ""),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.white24,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 150,
                          child: ListView.builder(
                            itemCount: state.weatherModel.forecast?.forecastday?[0].hour?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final hour = state.weatherModel.forecast?.forecastday?[0].hour?[index];
                              return HourlyWeather(hour: hour);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red)),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
