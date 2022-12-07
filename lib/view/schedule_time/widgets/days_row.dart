import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:waybeo/controller/schedule_controller.dart';
import 'package:waybeo/view/schedule_time/widgets/chips.dart';

import '../../../util/utilities.dart';

class DaySelection extends GetView<SchduleController> {
  const DaySelection({
    Key? key,
    required this.uniq,
    required this.selected,
    required this.day,
    required this.onTap,
  }) : super(key: key);
  final String day;
  final dynamic Function(bool?)? onTap;
  final RxBool selected;
  final String uniq;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundCheckBox(
          onTap: onTap,
          size: 30,
          uncheckedWidget: const Icon(Icons.done, color: Colors.white),
          uncheckedColor: Colors.grey[300],
          borderColor: Colors.transparent,
        ),
        w5,
        Text(day.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.w600)),
        Obx(
          () => Expanded(
            child: selected.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chips(
                        uniq: uniq,
                        day: day,
                        timings: 'Morning $uniq',
                      ),
                      Chips(
                        uniq: uniq,
                        day: day,
                        timings: 'Afternoon $uniq',
                      ),
                      Chips(
                        uniq: uniq,
                        day: day,
                        timings: 'Evening $uniq',
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 48,
                    child: Center(
                      child: Text('Select any Day'),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
