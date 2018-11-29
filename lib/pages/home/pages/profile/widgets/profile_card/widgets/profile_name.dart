import 'package:Openbook/models/user.dart';
import 'package:flutter/material.dart';

class OBProfileName extends StatelessWidget {
  final User user;

  OBProfileName(this.user);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: user.updateSubject,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        var user = snapshot.data;
        var name = user?.getProfileName();

        if (name == null) return SizedBox(height: 20.0,);

        return Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        );
      },
    );
  }
}
