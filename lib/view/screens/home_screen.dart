import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app_bloc/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_bloc/view/screens/daily_weather_screen.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_text.dart';
import 'package:flutter_weather_app_bloc/view/widghts/main_text.dart';
import 'package:intl/intl.dart';
import '../../bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../widghts/hourly_weather.dart';
import 'add_weather_screen.dart';
import 'location_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    LocationScreen(),
    AddWeatherScreen(),
    DailyWeatherScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherBloc>().add(FetchWeather("auto:ip"));
    });

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xff1D2549),
            Color(0xff8042A5),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            return screens[index];
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, index) {
            return BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: index,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (i) => context.read<BottomNavCubit>().updateIndex(i),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  label: '', // required but hidden
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline_sharp),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: '',
                ),
              ],
            );
          },
        ),

      ),
      );
  }
}