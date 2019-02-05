import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;

  UserList(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, int index) {
          return buildUsers(users[index]);
        });
  }

  Widget buildUsers(UserModel user){
    return Card(
      child: Text(user.name),
    );
  }
}
