import 'package:flutter/material.dart';
import 'package:flutter_weather_app_bloc/routes/route_pages.dart';
import 'package:flutter_weather_app_bloc/view/widghts/custom_text.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreeen extends StatelessWidget {
  const WelcomeScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xff1D2549),
            Color(0xff8042A5),
            // Color(0xfff1D71F2),
          ],
          // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/cloud.png'),
              const Column(
                children: [
                  CustomText(
                      text: "Weather",
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  CustomText(
                      text: "ForeCasts", fontSize: 50, color: Color(0xffDDB130)),
                ],
              ),
             // SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  context.goNamed(Routes.HOME);
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  decoration: BoxDecoration(
                      color: const Color(0xffDDB130),
                      borderRadius: BorderRadius.circular(25)),
                  child: const CustomText(
                    text: "Get Start",
                    color: Color(0xff362A84),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
