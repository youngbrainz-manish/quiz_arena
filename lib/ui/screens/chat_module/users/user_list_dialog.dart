import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/core/models/user_model.dart';

class UserSelectDialog extends StatelessWidget {
  final List<UserModel> users;

  const UserSelectDialog({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_header(context), const Divider(height: 1), _userList(context)],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Select Yourself', style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _userList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, index) {
          final user = users[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                user.name[0].toUpperCase(),
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
            title: Text(user.name),
            onTap: () => Get.back(result: user),
          );
        },
      ),
    );
  }
}
