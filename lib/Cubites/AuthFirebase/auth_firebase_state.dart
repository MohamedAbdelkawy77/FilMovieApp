part of 'auth_firebase_cubit.dart';


sealed class AuthFirebaseState {}

final class AuthFirebaseInitial extends AuthFirebaseState {}

final class AuthFirebaseSuccess extends AuthFirebaseState {}

final class AuthFirebaseFailure extends AuthFirebaseState {
  final String errorMessage;

  AuthFirebaseFailure({required this.errorMessage});
}
