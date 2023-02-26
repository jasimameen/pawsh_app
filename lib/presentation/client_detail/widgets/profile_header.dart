import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsh_app/core/constants.dart';
import 'package:pawsh_app/core/extensions.dart';

import 'action_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          // Content
          const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(Constants.dummyPortrait),
          ),
          8.hSizedBox,

          // Name
          const Text(
            'Jerome Bell',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          4.hSizedBox,
          const Text(
            'Client since Nov 2020',
            textAlign: TextAlign.center,
            style: TextStyle(
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
