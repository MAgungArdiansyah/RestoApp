import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseServices {

  
  
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');

  Future addUser(String id, String name, String email) async {
    return await userCollection.doc(id).set(
      {
        'name' : name,
        'email' : email,
      }
    ).then((value) => 'done').catchError((error) => error.toString());
  }
  

}