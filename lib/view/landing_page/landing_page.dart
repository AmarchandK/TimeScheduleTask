import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waybeo/controller/schedule_controller.dart';

class LandingPage extends GetView<SchduleController> {
  LandingPage({Key? key}) : super(key: key);
  final SchduleController schduleController = Get.put(SchduleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: 'Hi Jose you are available in ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: List.generate(
                  controller.getTimesList().length,
                  (index) => TextSpan(
                    text: controller.getTimesList()[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
