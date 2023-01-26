import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_contact_event.dart';
part 'delete_contact_state.dart';

class DeleteContactBloc extends Bloc<DeleteContactEvent, DeleteContactState> {
  DeleteContactBloc() : super(DeleteContactInitial()) {
    on<DeleteContactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
