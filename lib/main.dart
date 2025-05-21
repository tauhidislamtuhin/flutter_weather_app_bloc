import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_app_bloc/bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:flutter_weather_app_bloc/bloc/weather_bloc.dart';
import 'package:flutter_weather_app_bloc/data/services/api_service.dart';
import 'package:flutter_weather_app_bloc/routes/route_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
          providers: [
             BlocProvider(create: (context) => WeatherBloc(ApiService())),
             BlocProvider(create: (context) => BottomNavCubit()),
          ],
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp.router(
                /*theme: const MaterialTheme(TextTheme()).light(),
                darkTheme: const MaterialTheme(TextTheme()).dark(),*/
                debugShowCheckedModeBanner: false,
                routerConfig: RoutePages.ROUTER,
              );
            },
          ));
  }
}
