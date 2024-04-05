import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Успешно авторизованы';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'слабый пароль') {
        return 'Придумайте более надежный пароль.';
      } else if (e.code == 'email уже существует') {
        return 'Пользователь с таким  email уже существует.';
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Вход успешен ';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'пользователь не найден') {
        return 'Пользователь с таким  email не найден.';
      } else if (e.code == 'не правильный пароль') {
        return 'Не правильный пароль для этого пользователья.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}