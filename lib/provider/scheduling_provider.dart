import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:restauran_app/until/bg_service.dart';

import '../until/date_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      if (kDebugMode) {
        print('Scheduling Foodies Activated');
      }
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      if (kDebugMode) {
        print('Scheduling Foodies Canceled');
      }
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
