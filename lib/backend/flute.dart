import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        
    return true;
  } catch (e) {
    return false;
  }
}

Future<String> inData() async {
  
  final User ab = FirebaseAuth.instance.currentUser!;
  final uid = ab.uid;
  //print(uid);
  return uid;
}
