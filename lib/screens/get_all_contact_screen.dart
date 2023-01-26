import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/app/app.dart';
import 'package:users_contacts/bloc/contact_single_bloc/single_state_bloc.dart';
import 'package:users_contacts/cubit/get_user_contact_cubit.dart';
import 'package:users_contacts/cubit/get_user_contact_state.dart';
import 'package:users_contacts/screens/add_screen.dart';
import 'package:users_contacts/screens/update_screen.dart';

class GetContactPage extends StatefulWidget {
  const GetContactPage({Key? key}) : super(key: key);

  @override
  State<GetContactPage> createState() => _GetContactPageState();
}

class _GetContactPageState extends State<GetContactPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserContactsCubit, UserContactState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("All Contact"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddContactPage()));
                },
                icon: const Icon(Icons.person_add_alt_1),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              state is LoadGetContactsInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : state is LoadGetContactsInSuccess
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: state.userModel.length,
                            itemBuilder: (context, index) {
                              debugPrint("Length : ${state.userModel.length}");
                              return Card(
                                elevation: 3,
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 30,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        children: [
                                          Text(state.userModel[index].name),
                                          Text(state
                                              .userModel[index].phoneNumber),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      UpdateContactPage(
                                                    userModel:
                                                        state.userModel[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<AUDStateBloc>(
                                              context,
                                            ).add(DeleteContact(
                                                contactId: state
                                                    .userModel[index].id!));
                                            BlocProvider.of<
                                                        GetUserContactsCubit>(
                                                    context)
                                                .fetchAllContacts();
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : state is LoadGetContactsInFailure
                          ? Center(child: Text(state.error))
                          : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
