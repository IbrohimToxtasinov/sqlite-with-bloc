import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/contact_single_bloc/single_state_bloc.dart';
import 'package:users_contacts/cubit/get_user_contact_cubit.dart';
import 'package:users_contacts/data/models/user_contacts_model.dart';
import 'package:users_contacts/screens/get_all_contact_screen.dart';
import 'package:users_contacts/utils/my_utils.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AUDStateBloc, ContactsState>(builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                maxLength: 15,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  labelText: "Name",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: phoneNumberController,
                maxLength: 15,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  labelText: "Phone Number",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AUDStateBloc>(context).add(
                    AddContact(
                      contact: UserModel(
                          name: nameController.text,
                          phoneNumber: phoneNumberController.text,
                          createdAt: DateTime.now().toString()),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add Contact",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if (state.status == ContactSate.contactAdded) {
        BlocProvider.of<GetUserContactsCubit>(context).fetchAllContacts();
        MyUtils.getMyToast(message: "Muvafaqiyatli qoshildi");
      }
    });
  }
}
