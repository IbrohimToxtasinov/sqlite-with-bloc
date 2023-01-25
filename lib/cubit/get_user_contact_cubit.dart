import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/cubit/get_user_contact_state.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';
import 'package:users_contacts/data/repository/user_contact_repository.dart';

class GetUserContactsCubit extends Cubit<UserContactState> {
  GetUserContactsCubit({required this.userContactRepository})
      : super(InitialGetContacts()) {
    _fetchAllAppointments();
  }

  final UserContactRepository userContactRepository;

  _fetchAllAppointments() {
    emit(LoadGetContactsInProgress());
    userContactRepository
        .getAllContacts()
        .asStream()
        .listen((List<UserModel> listAppointments) {
      emit(LoadGetContactsInSuccess(userModel: listAppointments));
    });
  }
}
