import 'package:flutter/material.dart';
import 'package:flutterp/const.dart';
import 'package:flutterp/controllers/getvalues_controller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  DateTime now = DateTime.now();
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
          child: GetX<GetValuesController>(
            builder: (controller) {
              return controller.isLoading.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: white,
                          ),
                          20.heightBox,
                          'Fetching Data 😀...'
                              .text
                              .white
                              .bold
                              .size(sizew * 0.055)
                              .make(),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(sizew * 0.02),
                          margin: EdgeInsets.all(sizew * 0.03),
                          height: sizeh * 0.080,
                          width: sizew * 0.6,
                          decoration: BoxDecoration(
                              gradient: gradientBg,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: font * 28,
                                color: white,
                              ).onTap(() {
                                // showDatePicker(context: context, initialDate: , firstDate: firstDate, lastDate: lastDate)
                              }),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: font * 28,
                                    color: white,
                                  ),
                                  'Faisalabad'
                                      .text
                                      .size(sizew * 0.055)
                                      .white
                                      .make(),
                                ],
                              ),
                              Icon(
                                Icons.search,
                                size: font * 28,
                                color: white,
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            getWeatherIcon(controller.id.toInt())
                                .text
                                .size(sizew * 0.18)
                                .make(),
                            '${controller.temp}\u2103'
                                .text
                                .size(sizew * 0.15)
                                .white
                                .make(),
                            Padding(
                              padding: EdgeInsets.all(sizeh * 0.01),
                              child: controller.description.value
                                  .toString()
                                  .text
                                  .size(sizew * 0.08)
                                  .white
                                  .letterSpacing(2)
                                  .make(),
                            ),
                            '${now.day} / ${now.month} / ${now.year}'
                                .toString()
                                .text
                                .white
                                .size(sizew * 0.04)
                                .make(),
                          ],
                        ),
                        Container(
                          height: sizeh * 0.25,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.water_drop_outlined,
                                    size: sizew * 0.1,
                                  ),
                                  '${controller.humidity} %'
                                      .text
                                      .bold
                                      .size(sizew * 0.05)
                                      .make(),
                                  'Humidity'.text.size(sizew * 0.05).bold.make()
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.water_outlined,
                                    size: sizew * 0.1,
                                  ),
                                  '${controller.cloud} %'
                                      .text
                                      .size(sizew * 0.05)
                                      .bold
                                      .make(),
                                  'Rain'.text.size(sizew * 0.05).bold.make()
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.air_outlined,
                                    size: sizew * 0.1,
                                  ),
                                  "${controller.wind.value} m's"
                                      .text
                                      .bold
                                      .size(sizew * 0.05)
                                      .make(),
                                  'Wind'.text.size(sizew * 0.05).bold.make()
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
