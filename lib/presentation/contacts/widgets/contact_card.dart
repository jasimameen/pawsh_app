// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pawsh_app/domain/entities/user.dart';
import 'package:pawsh_app/presentation/client_detail/pages/client_detail_page.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientDetailPage(),
              ),
            );
          },

          // avathar
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(userData.imageUrl),
            onBackgroundImageError: (_, __) => const Center(
              child: Icon(CupertinoIcons.wifi_exclamationmark),
            ),
          ),

          contentPadding: EdgeInsets.zero,

          // title
          title: Text(
            userData.name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),

          // recent message
          subtitle: const Text(
            'Hachi: Maltese',
            style: TextStyle(fontSize: 13),
          ),

          // trailing
          trailing: const Text(
            'New',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xffFF0083),
            ),
          ),
        ),
      ),
    );
  }
}
