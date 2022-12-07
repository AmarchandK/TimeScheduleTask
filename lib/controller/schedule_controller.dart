import 'package:get/state_manager.dart';

class SchduleController extends GetxController {
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<RxBool> daySelectionBools = List.generate(7, (_) => false.obs);
  final List<String> tempTimings = [];
  final Map<String, List<String>> availableTimeMap = {};

  @override
  void onInit() {
    _keyCreate();
    super.onInit();
  }

  void isSelect({required String timings}) {
    tempTimings.contains(timings)
        ? tempTimings.remove(timings)
        : tempTimings.add(timings);
    _addScheduleToMap(timings);
    update();
  }

  List<String> getTimesList() {
    List<String> tempList = [];
    availableTimeMap.forEach((key, value) {
      String values = '';
      if (value.isNotEmpty) {
        if (value.length == 3) {
          values += 'Whole day, ';
        } else {
          for (int i = 0; i < value.length; i++) {
            values += '${value[i]}, ';
          }
        }
        tempList.add("$key: $values");
      }
    });
    return tempList;
  }

  void _addScheduleToMap(String timings) {
    final int uniqs = int.parse(timings.split(' ').last);
    final String scheduledTimes = timings.split(' ').first;
    switch (uniqs) {
      case 0:
        _listCheck(scheduledTimes, 0);
        break;
      case 1:
        _listCheck(scheduledTimes, 1);
        break;
      case 2:
        _listCheck(scheduledTimes, 2);
        break;
      case 3:
        _listCheck(scheduledTimes, 3);
        break;
      case 4:
        _listCheck(scheduledTimes, 4);
        break;
      case 5:
        _listCheck(scheduledTimes, 5);
        break;
      case 6:
        _listCheck(scheduledTimes, 6);
        break;
    }
  }

  void _keyCreate() {
    for (var item in days) {
      availableTimeMap[item] = [];
    }
  }

  void _listCheck(String time, int index) {
    availableTimeMap[days[index]]!.contains(time)
        ? availableTimeMap[days[index]]!.remove(time)
        : availableTimeMap[days[index]]!.add(time);
  }
}
