part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  User? user;
  AuthenticatedState({this.user});
}

class UnAuthenticatedState extends AuthState {}

class AuthenticatedErrorState extends AuthState {
  final String message;
  AuthenticatedErrorState({required this.message});
}
