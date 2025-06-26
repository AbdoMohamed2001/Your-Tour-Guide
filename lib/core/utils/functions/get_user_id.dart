import 'package:firebase_auth/firebase_auth.dart';

dynamic getUserId() {
  return FirebaseAuth.instance.currentUser?.uid;
}
