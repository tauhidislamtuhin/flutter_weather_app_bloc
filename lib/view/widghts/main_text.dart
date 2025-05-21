import 'package:flutter/material.dart';

import 'custom_text.dart';

class MainText extends StatelessWidget {
  final String text;
  final String maxTem;
  final String minTem;

  const MainText(
      {super.key,
      required this.text,
      required this.maxTem,
      required this.minTem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(text: text),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Max: $maxTem"),
            const CustomText(text: "o", fontSize: 10),
            const SizedBox(width: 15),
            CustomText(text: "Min: $minTem"),
            const CustomText(text: "o", fontSize: 10),
          ],
        ),
      ],
    );
  }
}
