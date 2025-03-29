import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickshop/features/auth/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;

      try {
        await Future.delayed(
          Duration(seconds: 2),
          () {
            user = _auth.currentUser;
          },
        );
        if (user != null) {
          emit(AuthenticatedState());
        } else {
          emit(UnAuthenticatedState());
        }
      } catch (e) {
        emit(AuthenticatedErrorState(message: e.toString()));
      }
    });

    on<SignupEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.user.email.toString(),
            password: event.user.password.toString(),
          );
          final user = userCredential.user;
          if (user != null) {
            FirebaseFirestore.instance.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'email': user.email,
              'name': event.user.name,
              'phone': event.user.phone,
              'createdAt': DateTime.now(),
            });
            emit(AuthenticatedState(user: user));
          } else {
            emit(UnAuthenticatedState());
          }
        } catch (e) {
          emit(AuthenticatedErrorState(message: '$e'));
        }
      },
    );
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final userCredential = await _auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          final user = userCredential.user;
          if (user != null) {
            emit(AuthenticatedState(user: user));
          } else {
            emit(UnAuthenticatedState());
          }
        } catch (e) {
          AuthenticatedErrorState(message: e.toString());
        }
      },
    );

    on<LogoutEvent>(
      (event, emit) async {
        try {
          await _auth.signOut();
          emit(UnAuthenticatedState());
        } catch (e) {
          emit(AuthenticatedErrorState(message: e.toString()));
          //emit(UnAuthenticatedState());
        }
      },
    );
  }
}
