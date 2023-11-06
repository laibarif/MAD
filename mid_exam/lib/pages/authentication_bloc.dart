import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSignInEvent extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticationSignInEvent({required this.username, required this.password});

@override
List<Object> get props => [username, password];
}

class AuthenticationRegisterEvent extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticationRegisterEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class AuthenticationSignOutEvent extends AuthenticationEvent {}

class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {}

class AuthenticationUnauthenticatedState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String error;

  AuthenticationErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository}) : super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthenticationSignInEvent) {
      final username = event.username;
      final password = event.password;
      try {
        final isAuthenticated = await userRepository.authenticateUser(username, password);
        if (isAuthenticated) {
          yield AuthenticationAuthenticatedState();
        } else {
          yield AuthenticationErrorState(error: 'Invalid username or password.');
        }
      } catch (e) {
        yield AuthenticationErrorState(error: e.toString());
      }
    } else if (event is AuthenticationRegisterEvent) {
      final username = event.username;
      final password = event.password;
      try {
        await userRepository.registerUser(username, password);
        yield AuthenticationAuthenticatedState();
      } catch (e) {
        yield AuthenticationErrorState(error: e.toString());
      }
    } else if (event is AuthenticationSignOutEvent) {
      yield AuthenticationUnauthenticatedState();
    }
  }
}

class UserRepository {
  // Simulated in-memory user data for demonstration purposes.
  final Map<String, String> _userCredentials = {
    'abc': '123', // Replace with your user data.
  };

  // User registration (can be used to add new users).
  Future<void> registerUser(String username, String password) async {
    if (_userCredentials.containsKey(username)) {
      throw Exception('Username already exists.'); // Username is already taken.
    }
    _userCredentials[username] = password;
  }

  // User authentication (checks if username and password match).
  Future<bool> authenticateUser(String username, String password) async {
    final storedPassword = _userCredentials[username];
    return storedPassword != null && storedPassword == password;
  }
}
