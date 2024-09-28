import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'workoutdetails_event.dart';
part 'workoutdetails_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  final WorkoutData workout;
  WorkoutDetailsBloc({required this.workout}) : super(WorkoutDetailsInitial()) {
    on<BackTappedEvent>(_onBackTapped);
    on<WorkoutExerciseCellTappedEvent>(_onWorkoutExerciseCellTapped);
  }

  void _onBackTapped(BackTappedEvent event, Emitter<WorkoutDetailsState> emit) {
    emit(BackTappedState());
  }

  void _onWorkoutExerciseCellTapped(
      WorkoutExerciseCellTappedEvent event, Emitter<WorkoutDetailsState> emit) {
    emit(WorkoutExerciseCellTappedState(
      currentExercise: event.currentExercise,
      nextExercise: event.nextExercise,
    ));
  }
}
