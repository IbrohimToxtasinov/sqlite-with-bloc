import 'package:users_contacts/data/database/local_database.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';

class UserContactRepository {
  Future<int> deleteAllContacts() => LocalDatabase.deleteAll();
  Future<int> deleteContactById({required int id}) => LocalDatabase.deleteContactById(id: id);

  Future<UserModel> addContact({required UserModel userModel}) =>
      LocalDatabase.insertToDatabase(userModel: userModel);

  Future<List<UserModel>> getAllContacts() => LocalDatabase.getList();

  Future<UserModel> updateContacts({required UserModel userModel}) =>
      LocalDatabase.updateTaskById(updatedContact: userModel);
}