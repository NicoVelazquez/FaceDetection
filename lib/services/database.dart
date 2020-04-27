import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facedetection/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference taskCollection = Firestore.instance.collection('tasks');

  //  get user doc stream
  Stream<User> get user {
    return userCollection.document(uid).snapshots().map(_userFromSnapshot);
  }

  //  userData from snapshot
  User _userFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      name: snapshot.data['name'],
      lastname: snapshot.data['lastname'],
      email: snapshot.data['email'],
    );
  }

  Future<bool> createUser(String name, String lastname) async {
    await userCollection.document(uid).setData({
      'name': name,
      'lastname': lastname
    });
    return true;
  }

  Future<String> createTask(dynamic iamge) async {
    DocumentReference ref = await taskCollection.add({
//      'title': task.title,
    });
    return (ref.documentID);
  }
}
