import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_bloc/view/widghts/main_text.dart';

import '../../bloc/weather_bloc.dart';

class AddWeatherScreen extends StatelessWidget {
  const AddWeatherScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

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
