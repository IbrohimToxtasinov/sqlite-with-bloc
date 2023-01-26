import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_state_event.dart';
part 'single_state_state.dart';

class SingleStateBloc extends Bloc<SingleStateEvent, SingleStateState> {
  SingleStateBloc() : super(SingleStateInitial()) {
    on<SingleStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
