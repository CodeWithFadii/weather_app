import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterp/const.dart';
import 'package:flutterp/controllers/getapi_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  var getApiController = Get.find<GetApiController>();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    double sizew = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(gradient: gradientBg),
          child: GetX<GetApiController>(builder: (controller) {
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
                              size: sizew * 0.07,
                              color: white,
                            ).onTap(() {
                              showDatePicker(
                                      context: context,
                                      initialDate: dateTime,
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2024))
                                  .then((value) async {
                                if (value == null) {
                                  return;
                                }
                                dateTime = value;
                                controller.selectedDate.value =
                                    DateFormat('dd-MM-yyyy').format(value);
                                log(controller.selectedDate.value);
                                controller.getResponse();
                              });
                            }),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: sizew * 0.07,
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
                              size: sizew * 0.07,
                              color: white,
                            )
                          ],
                        ),
                      ),
                      controller.matchedList.isEmpty
                          ? 'No Data Available'.text.size(sizew * 0.2).make()
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.matchedList.length,
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: sizeh * 0.2,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: sizeh * 0.04,
                                        vertical: sizew * 0.02),
                                    decoration: BoxDecoration(
                                        gradient: gradientBg,
                                        borderRadius: BorderRadius.circular(
                                            sizew * 0.03)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        getdtText(controller
                                                .matchedList[index].dtTxt
                                                .toString())
                                            .toString()
                                            .text
                                            .white
                                            .size(sizew * 0.05)
                                            .make(),
                                        Flexible(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              '${controller.matchedList[index].main!.temp} \u2103'
                                                  .toString()
                                                  .text
                                                  .white
                                                  .bold
                                                  .size(sizew * 0.11)
                                                  .make(),
                                              controller.matchedList[index]
                                                  .weather![0].main
                                                  .toString()
                                                  .text
                                                  .uppercase
                                                  .size(sizew * 0.05)
                                                  .white
                                                  .make()
                                            ],
                                          ),
                                        ),
                                        controller.matchedList[index].dt
                                            .toString()
                                            .text
                                            .white
                                            .make()
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                    ],
                  );
          }),
        ),
      ),
    );
  }

  getdtText(String text) {
    final DateTime dateTime = DateTime.parse(text);
    return DateFormat('h:mm a').format(dateTime);
  }
}
