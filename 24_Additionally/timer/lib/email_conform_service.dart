import 'dart:async';

class TimerService {
  TimerService._();

  static final TimerService _instance = TimerService._();
  factory TimerService() => _instance;

  Timer? timer;
  int seconds = 0;

  void start() {
    if (timer?.isActive ?? false) return;
    seconds = 20; //DurationConstants.emailConfirmation.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), timerCallback);
  }

  void timerCallback(Timer timer) {
    if (seconds == 0) {
      timer.cancel();
      return;
    }
    seconds--;
  }

  void stop() {
    timer?.cancel();
    seconds = 0;
  }
}
