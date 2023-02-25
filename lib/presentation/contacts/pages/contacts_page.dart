import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsh_app/core/extensions.dart';

import '../widgets/contact_card.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // body
      child: Column(
        children: [
          // header
          const _Header(),

          // Contacs view
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const ContactCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top bar
            const CupertinoNavigationBar(
              backgroundColor: CupertinoColors.white,
              trailing: Icon(CupertinoIcons.add_circled),
              border: Border(),
            ),

            // Title Bar
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w700),
                  children: [
                    // big text
                    TextSpan(
                      text: 'Clients',
                      style: TextStyle(fontSize: 34),
                    ),

                    // count
                    TextSpan(
                      text: ' (200)',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // search field
            const CupertinoSearchTextField(),

            // space
            16.hSizedBox,
          ],
        ),
      ),
    );
  }
}
