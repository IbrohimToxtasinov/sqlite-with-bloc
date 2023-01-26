import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_contact_event.dart';
part 'update_contact_state.dart';

class UpdateContactBloc extends Bloc<UpdateContactEvent, UpdateContactState> {
  UpdateContactBloc() : super(UpdateContactInitial()) {
    on<UpdateContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
