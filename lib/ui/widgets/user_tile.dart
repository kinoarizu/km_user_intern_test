import 'package:flutter/material.dart';
import 'package:suitmedia_intern_test_app/models/user_model.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: SizedBox(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    user.avatar,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                  '${user.firstName} ${user.lastName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
