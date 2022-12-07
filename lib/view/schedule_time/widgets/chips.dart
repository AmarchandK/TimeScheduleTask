import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waybeo/controller/schedule_controller.dart';

class Chips extends GetView<SchduleController> {
  const Chips({
    Key? key,
    required this.uniq,
    required this.day,
    required this.timings,
  }) : super(key: key);
  final String timings;
  final String day;
  final String uniq;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchduleController>(
      builder: (controller) {
        return ChoiceChip(
            label: Text(timings.split(' ').first),
            selected: controller.tempTimings.contains(timings),
            onSelected: (value) {
              controller.isSelect(timings: timings);
            },
            shape: StadiumBorder(
              side: BorderSide(color: Colors.blue[800]!),
            ),
            selectedColor: Colors.green[300],
            disabledColor: Colors.transparent);
      },
    );
  }
}
