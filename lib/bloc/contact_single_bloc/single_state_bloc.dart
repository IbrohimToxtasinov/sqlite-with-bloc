import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';
import 'package:users_contacts/data/repository/user_contact_repository.dart';

part 'single_state_event.dart';

part 'single_state_state.dart';

class AUDStateBloc extends Bloc<ContactsEvent, ContactsState> {
  AUDStateBloc({required this.userContactRepository})
      : super(ContactsState(
            status: ContactSate.pure, contact: [], statusText: "")) {
    on<AddContact>(_addContact);
    on<UpdateContact>(_updateContact);
    on<DeleteContact>(_deleteContact);
  }

  UserContactRepository userContactRepository;

  _addContact(AddContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactSate.loading));
    var newContact = userContactRepository.addContact(userModel: event.contact);
    if (newContact != null) {
      emit(state.copyWith(status: ContactSate.contactAdded));
    }
  }

  _updateContact(UpdateContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactSate.loading));
    userContactRepository.updateContacts(userModel: event.userModel);
    emit(state.copyWith(status: ContactSate.contactUpdate));
  }

  _deleteContact(DeleteContact event, Emitter<ContactsState> emit) async {
    emit(state.copyWith(status: ContactSate.loading));
    var deleteId = userContactRepository.deleteContactById(id: event.contactId);
    if (deleteId != -1) {
      emit(state.copyWith(status: ContactSate.contactDelete));
    }
  }
}

enum MyStatus {
  ERROR,
  SUCCESS,
  LOADING,
  PURE,
}
