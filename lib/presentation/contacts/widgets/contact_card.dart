import 'package:flutter/material.dart';
import 'package:pawsh_app/core/constants.dart';
import 'package:pawsh_app/presentation/client_detail/pages/client_detail_page.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
  }) : super(key: key);

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
          leading: const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(Constants.dummyPortrait),
          ),

          contentPadding: EdgeInsets.zero,

          // title
          title: const Text(
            'Robert Fox',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
