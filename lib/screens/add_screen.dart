import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/add_contact/add_contact_bloc.dart';
import 'package:users_contacts/bloc/add_contact/add_contact_event.dart';
import 'package:users_contacts/screens/get_all_contact_screen.dart';
import 'package:users_contacts/utils/my_utils.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
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
                if (nameController.text.isNotEmpty) {
                  if (phoneNumberController.text.isNotEmpty) {
                    BlocProvider.of<SingleAddContactBloc>(context).add(
                      UpdateContact(
                        name: nameController.text,
                        phoneNumber: phoneNumberController.text,
                        createdAt: DateTime.now().toString(),
                      ),
                    );
                    BlocProvider.of<SingleAddContactBloc>(context)
                        .add(AddContact());
                    MyUtils.getMyToast(message: "Contact qo'shildi");
                    Navigator.pop(context);
                  } else {
                    MyUtils.getMyToast(message: "Telefon Raqam kiriting !!!");
                    return;
                  }
                } else {
                  MyUtils.getMyToast(message: "Ism kiriting !!!");
                  return;
                }
                Future.delayed(const Duration(seconds: 3)).then((value) =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AllContactScreen())));
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
  }
}
