class User {
  String name;
  String nim;
  String address;

  User({required this.name, required this.nim, required this.address});

  static User fromMap(Map<String, dynamic> map) {
    return User(name: map["name"], nim: map["nim"], address: map["address"]);
  }
}
