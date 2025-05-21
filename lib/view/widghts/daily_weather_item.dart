import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/weather_model.dart';
import 'custom_text.dart';
class DailyWeatherItem extends StatelessWidget {
  final Forecastday? forecastday;
  const DailyWeatherItem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xff1D2549),
            Color(0xff8042A5),
          ],
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "${forecastday?.day?.avgtempC?.round()}",
                fontWeight: FontWeight.bold,
              ),
              const Text("o", style: TextStyle(color: Colors.white, fontSize: 10)),
            ],
          ),
          Image.network("https:${forecastday?.day?.condition?.icon ?? ""}"),
          CustomText(
            text: DateFormat.E().format(
              DateTime.parse(forecastday?.date ?? ""),
            ),
          ),
        ],
      ),
    );
  }
}


