import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ListTile(
          // avathar
          leading: CircleAvatar(radius: 20),

          // title
          title: Text(
            'Robert Fox',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),

          // recent message
          subtitle: Text(
            'Hachi: Maltese',
            style: TextStyle(fontSize: 13),
          ),

          // trailing
          trailing: Text(
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
