import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_bar_event.dart';
part 'tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<TabBarItemTappedEvent>(_onTabBarItemTapped);
  }

  void _onTabBarItemTapped(
      TabBarItemTappedEvent event, Emitter<TabBarState> emit) {
    // Implement the logic for handling tab bar item taps
    emit(TabBarItemSelectedState(index: event.index));
  }

  int currentIndex = 0;
  bool isSelected = false;

  @override
  Stream<TabBarState> mapEventToState(
    TabBarEvent event,
  ) async* {
    if (event is TabBarItemTappedEvent) {
      currentIndex = event.index;
      yield TabBarItemSelectedState(index: currentIndex);
    }
  }
}
