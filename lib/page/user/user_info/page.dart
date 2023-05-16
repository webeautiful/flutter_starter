import 'package:flutter/material.dart';
import 'package:flutter_starter/router.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(
              onPressed: () => appRouter.pop(),
              icon: const Icon(Icons.arrow_back)),
        ),
        Text('This page is user info page, userId: $id'),
      ],
    );
  }
}
