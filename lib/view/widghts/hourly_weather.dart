import 'package:flutter/material.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_text.dart';
import 'package:intl/intl.dart';

import '../../data/model/weather_model.dart';

class HourlyWeather extends StatelessWidget {
  final Hour? hour;

  const HourlyWeather({Key? key, this.hour})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: 80,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text:hour?.tempC?.round().toString() ??"",
                      fontWeight: FontWeight.bold,),
              const Text("o", style: TextStyle(color: Colors.white,fontSize: 10)),
            ],
          ),
          Image.network("https:${hour?.condition?.icon.toString()}"),
          CustomText(text:
          DateFormat.Hm().format(
              DateTime.parse(hour?.time?.toString() ?? ""))),
        ],
      ),
    );
  }
}