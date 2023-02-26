import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pawsh_app/core/extensions.dart';
import 'package:pawsh_app/domain/entities/user.dart';

import 'action_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          // Content
          Hero(
            tag: user.id,
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
          ),
          8.hSizedBox,

          // Name
          Text(
            user.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          4.hSizedBox,
          Text(
            'Client since ${user.joinedDate}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff717171),
            ),
          ),

          16.hSizedBox,

          // buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ActionButton(label: 'Call', iconData: CupertinoIcons.phone_fill),
              ActionButton(
                  label: 'Chat', iconData: CupertinoIcons.text_bubble_fill),
              ActionButton(label: 'More', iconData: CupertinoIcons.ellipsis),
            ],
          ),
        ],
      ),
    );
  }
}
