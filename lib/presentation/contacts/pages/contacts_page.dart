import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawsh_app/core/extensions.dart';
import 'package:pawsh_app/domain/entities/user.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/contact_bloc.dart';
import '../widgets/contact_card.dart';
import '../widgets/contacts_search_bar.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContactBloc>().add(const ContactEvent.fetchAllContacts());
    });

    return Scaffold(
      // body
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            // header
            const _Header(),

            // Contacs view
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const _Loader();
                    }

                    if (state.isError) {
                      return Center(
                        child: GestureDetector(
                            onTap: () async {
                              context
                                  .read<ContactBloc>()
                                  .add(const ContactEvent.fetchAllContacts());
                            },
                            child: const Text(
                                'Oops Something Went Wrong Try again')),
                      );
                    }

                    if (state.contacts.isEmpty) {
                      return const Center(child: Text('Empty List'));
                    }

                    final contacts = state.contacts;
                    return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return ContactCard(userData: contacts[index]);
                      },
                      physics: const BouncingScrollPhysics(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, __) => const ContactCard(
          userData: User(
            id: '',
            name: 'loading',
            joinedDate: '',
            imageUrl: '',
          ),
        ),
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
              child: BlocBuilder<ContactBloc, ContactState>(
                buildWhen: (prev, curr) =>
                    prev.contacts.length != curr.contacts.length,
                builder: (context, state) {
                  return RichText(
                    text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      children: [
                        // big text
                        const TextSpan(
                          text: 'Clients',
                          style: TextStyle(fontSize: 34, color: Colors.black),
                        ),

                        // count
                        TextSpan(
                          text: ' (${state.contacts.length})',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // search field
            const ContactsSearchBar(),

            // space
            16.hSizedBox,
          ],
        ),
      ),
    );
  }
}
