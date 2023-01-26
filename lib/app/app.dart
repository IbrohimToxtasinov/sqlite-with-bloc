import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_contacts/bloc/contact_single_bloc/single_state_bloc.dart';
import 'package:users_contacts/cubit/get_user_contact_cubit.dart';
import 'package:users_contacts/data/repository/user_contact_repository.dart';
import 'package:users_contacts/screens/get_all_contact_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserContactRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetUserContactsCubit(
                userContactRepository: context.read<UserContactRepository>()
                  ..getAllContacts(),
              ),
            ),
            BlocProvider(
              create: (context) => AUDStateBloc(
                userContactRepository: context.read<UserContactRepository>(),
              ),
            ),
          ],
          child: MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetContactPage(),
    );
  }
}
