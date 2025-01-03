import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoesly_priority_soft/core/injection/injection.dart';

import '../../../core/shared/session_manager/i_session_manager.dart';

class AuthService {
  User? user;

  Future<String?> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final value = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = value.user;
      await user!.updateProfile(displayName: name);
      await user!.reload();
      user = FirebaseAuth.instance.currentUser;

      final token = await user!.getIdToken();
      if (token == '') {
        return 'Something went wrong';
      }
      getIt<ISessionManager>().saveToken(
        accessToken: value.credential!.accessToken!,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final value = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = value.user;
      final token = await value.user!.getIdToken();
      if (token == null || token == '') {
        return 'Something went wrong';
      }
      getIt<ISessionManager>().saveToken(
        accessToken: token,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await getIt<ISessionManager>().clearSession();
  }
}
