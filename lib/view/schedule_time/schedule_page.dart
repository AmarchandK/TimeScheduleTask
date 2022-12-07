import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waybeo/controller/schedule_controller.dart';
import 'package:waybeo/view/landing_page/landing_page.dart';
import 'package:waybeo/view/schedule_time/widgets/days_row.dart';

import '../../util/utilities.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({super.key});
  final SchduleController controller =
      Get.put(SchduleController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h20,
                const Text(
                  'Set Your Weekly Hours ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(
                    endIndent: 5,
                    indent: 5,
                    thickness: 1.3,
                  ),
                  itemCount: controller.days.length,
                  itemBuilder: (context, index) {
                    return DaySelection(
                      uniq: index.toString(),
                      day: controller.days[index],
                      onTap: (select) {
                        controller.daySelectionBools[index].value =
                            select ?? false;
                      },
                      selected: controller.daySelectionBools[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => LandingPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[400],
              shape: const StadiumBorder(),
            ),
            child: const Text('Save', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
