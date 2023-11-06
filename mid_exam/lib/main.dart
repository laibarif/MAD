import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:mid_exam/pages/authentication_bloc.dart'; // Import your AuthenticationBloc
import 'package:mid_exam/pages/sign_in.dart'; // Import your SignInPage
// import 'user_repository.dart'; // Import your UserRepository

void main() {
  UserRepository userRepository = UserRepository();

  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc(userRepository: userRepository)),
      ],
      child: MaterialApp(
        title: 'Sign In App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInPage(),
      ),
    );
  }
}
