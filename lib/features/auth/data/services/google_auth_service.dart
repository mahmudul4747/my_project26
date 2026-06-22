import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> login(String email, String password) async {
  try {
    UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    print("Login Success");

    String uid = userCredential.user!.uid;
    print("UID = $uid");

    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(uid).get();

    print("Document Exists = ${userDoc.exists}");

    if (!userDoc.exists) {
      return "User not found in Firestore";
    }

    String role = userDoc['role'];
    print("Role = $role");

    return role;
  } on FirebaseAuthException catch (e) {
    print("Error Code = ${e.code}");
    print("Error Message = ${e.message}");
    return e.message;
  }
}
  User? get currentUser => _auth.currentUser;
}