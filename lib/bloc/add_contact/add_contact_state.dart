import 'package:equatable/equatable.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';

class SingleAddContactState extends Equatable {
  final UserModel userModel;

  const SingleAddContactState({required this.userModel});

  SingleAddContactState copyWith({UserModel? userModel}) =>
      SingleAddContactState(
        userModel: userModel ?? this.userModel,
      );

  @override
  List<Object?> get props => [userModel];
}
