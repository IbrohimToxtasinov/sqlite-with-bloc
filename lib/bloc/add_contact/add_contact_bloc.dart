import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/add_contact/add_contact_event.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';
import 'package:users_contacts/data/repository/user_contact_repository.dart';

import 'add_contact_state.dart';

class SingleAddContactBloc
    extends Bloc<SingleAddContactEvent, SingleAddContactState> {
  SingleAddContactBloc({required this.userContactRepository})
      : super(
          SingleAddContactState(
            userModel: UserModel(name: "", phoneNumber: "", createdAt: ""),
          ),
        ) {
    on<UpdateContact>(_updateContact);
    on<AddContact>(_addContact);
  }

  final UserContactRepository userContactRepository;

  _updateContact(UpdateContact event, Emitter<SingleAddContactState> emit) {
    UserModel userModel = state.userModel.copyWith(
      name: event.name,
      phoneNumber: event.phoneNumber,
      createdAt: event.createdAt,
    );
    emit(state.copyWith(userModel: userModel));
  }

  _addContact(
      SingleAddContactEvent event, Emitter<SingleAddContactState> emit) {
    UserModel userModel = state.userModel;
    userContactRepository.addContact(userModel: userModel);
  }
}
