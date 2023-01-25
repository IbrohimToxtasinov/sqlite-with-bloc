import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/cubit/get_user_contact_cubit.dart';
import 'package:users_contacts/cubit/get_user_contact_state.dart';
import 'package:users_contacts/screens/add_screen.dart';

class AllContactScreen extends StatelessWidget {
  const AllContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserContactsCubit, UserContactState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("All Contacts"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddContactScreen()));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                                  title: Column(
                                    children: [
                                      Text(state.userModel[index].name),
                                      Text(state.userModel[index].phoneNumber),
                                    ],
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) => UpdateStudentsScreen(
                                              //       studentModel: students,
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            icon: const Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {
                                              // Provider.of<StudentsViewModel>(context,
                                              //     listen: false)
                                              //     .deleteStudent(students.studentId);
                                              //
                                              // print("DELETING ID:${students.studentId}");
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
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
