import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseServices {

  String? id;

  DatabaseServices({this.id});

  set uid (String uid){
    id = uid; 
  }
  
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('User');

  Future addUser(String name, String email) async {
    return await userCollection.doc(id).set(
      {
        'name' : name,
        'email' : email,
      }
    ).then((value) => 'done').catchError((error) => error.toString());
  }

  Stream<DocumentSnapshot> get user {
    return userCollection.doc(id).snapshots();
  }
} 