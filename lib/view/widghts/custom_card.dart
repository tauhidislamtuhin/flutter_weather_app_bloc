import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  final String topText;
  final String centerText;
  final String bottomText;
  final Color? color;
  final double? fontSize;
  const CustomCard({super.key, required this.topText, required this.centerText, required this.bottomText, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.45,
      padding: const EdgeInsets.all(25),
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
          border: Border.all(
              width: 1,
              color: Colors.white
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [
              const Icon(
                Icons.sunny,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomText(
                text: topText,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            text: centerText,
            fontSize: 35,
          ),
          const SizedBox(
            height: 10,
          ),

          CustomText(
            text: bottomText,
            color: color ?? Colors.white70,
            fontSize: fontSize ?? 18,
          )
        ],
      ),
    );
  }
}
