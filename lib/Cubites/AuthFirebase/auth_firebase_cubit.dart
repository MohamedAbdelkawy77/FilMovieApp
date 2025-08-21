import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
 

part 'auth_firebase_state.dart';

class AuthFirebaseCubit extends Cubit<AuthFirebaseState> {
  AuthFirebaseCubit() : super(AuthFirebaseInitial());
  void CreatAuth({required String Email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: password);
      emit(AuthFirebaseSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This Email Is Already Founded';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Not Vaild Email';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Weak password';
      } else {
        errorMessage = e.toString();
      }

      emit(AuthFirebaseFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(AuthFirebaseFailure(errorMessage: e.toString()));
    }
  }

  void LoginAuth({required String Email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: password);

      emit(AuthFirebaseSuccess());
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address';
      } else {
        errorMessage = 'Login failed, please try again';
      }

      emit(AuthFirebaseFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(AuthFirebaseFailure(errorMessage: e.toString()));
    }
  }
}



 
//   } catch (e) {
//     print("Google Auth Error: $e");
//     emit(AuthFirebaseFailure(errorMessage: "Google Sign-In Failed"));
//   }
// }