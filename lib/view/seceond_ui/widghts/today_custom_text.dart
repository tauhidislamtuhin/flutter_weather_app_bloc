

import 'package:flutter/material.dart';

class TodayCustomText extends StatelessWidget {
  final String text;
  final String value;
  const TodayCustomText({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),
        Text(value,
            style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
