import 'package:cloud_firestore/cloud_firestore.dart';

class References {
  static final constants =
      Firestore.instance.document("constants/IgfaX8L83XV6mZAkxkkY");

  static final users = Firestore.instance.collection("users");
}
