import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileViewModel {
  
  final user = FirebaseAuth.instance.currentUser;
  getuserDetails({required name, required email, required phone}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      name = value.data()!["name"];
      email = value.data()!["email"];
      phone = value.data()!["phone"];
      print(name);
    });
  }
}
