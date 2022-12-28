import 'package:flutter/material.dart';
import 'package:flutterp/const.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    double sizew = MediaQuery.of(context).size.width;
    double font = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(gradient: gradientBg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: sizeh * 0.080,
                width: sizew * 0.6,
                decoration: BoxDecoration(
                    gradient: gradientBg,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: font * 28,
                      color: white,
                    ),
                    3.widthBox,
                    'Lahore'.text.size(font * 21).white.make(),
                  ],
                ),
              ),
              Container(
                height: sizeh * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          size: font * 32,
                        ),
                        '24%'.text.make(),
                        'Humidity'.text.make()
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.water_outlined,
                          size: font * 32,
                        ),
                        '2%'.text.make(),
                        'Rain'.text.make()
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.air_outlined,
                          size: font * 32,
                        ),
                        '84%'.text.make(),
                        'Wind'.text.make()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
