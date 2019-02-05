
class UserTable{
  final int count;
  final int totalCount;
  final List<User> users;

  UserTable({this.count, this.totalCount, this.users});

  factory UserTable.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['le_usuario'] as List;
    List<User> userList = list.map((i) => User.fromJson(i)).toList();

    return UserTable(
      count: parsedJson['count']?? 0,
      totalCount: parsedJson['total_count']?? 0,
      users: userList
    );
  }
}

class User{
  final int id;
  final String name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> parsedJson){
    return User(
      id : parsedJson['id'] ?? 0,
      name : parsedJson['name'] ?? ""
    );
  }
}
