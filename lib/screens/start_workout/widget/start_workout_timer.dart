import 'package:custom_timer/custom_timer.dart';
import 'package:fitness_flutter/core/service/date_service.dart';
import 'package:flutter/material.dart';

class StartWorkoutTimer extends StatefulWidget {
  final int time;
  final bool isPaused;

  StartWorkoutTimer({
    required this.time,
    required this.isPaused,
  });

  @override
  _StartWorkoutTimerState createState() => _StartWorkoutTimerState();
}

class _StartWorkoutTimerState extends State<StartWorkoutTimer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.isPaused ? _createPauseText() : _createCountdownTimer();
  }

  Widget _createCountdownTimer() {
    late CustomTimerController controller = CustomTimerController(
        vsync: this,
        begin: Duration(seconds: widget.time),
        end: Duration(seconds: 0),
        initialState: CustomTimerState.reset,
        interval: CustomTimerInterval.milliseconds);
    // final controller = CustomTimerController(
    //   vsync: this,
    //   begin: Duration(seconds: widget.time),
    //   end: Duration(seconds: 0),
    //   // onBuildAction: CustomTimerAction.auto_start,
    // );

    return CustomTimer(
      key: Key("countdown_timer"),
      controller: controller,
      builder: (CustomTimerState state, CustomTimerRemainingTime remaining) {
        return Text(
          "${remaining.minutes}:${remaining.seconds}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        );
      },
    );
  }

  Widget _createPauseText() {
    final minutesSeconds = DateService.convertIntoSeconds(widget.time);
    return Text(
      "${minutesSeconds.minutes.toString().padLeft(2, '0')}:${minutesSeconds.seconds.toString().padLeft(2, '0')}",
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
