import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocalModule {
  // @Singleton()
  // FlutterSecureStorage secureStorage() => const FlutterSecureStorage();

  @Singleton()
  FirebaseFirestore firestore() => FirebaseFirestore.instance;

  @Singleton()
  FirebaseAuth firebaseAuth() => FirebaseAuth.instance;

  // @preResolve
  // Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
