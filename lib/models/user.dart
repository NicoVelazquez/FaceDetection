class UserId {
  final String uid;

  UserId({this.uid});
}

class User {
  final String uid;
  String name;
  String lastname;
  String email;

  User({
    this.uid,
    this.name,
    this.lastname,
    this.email,
  });
}
