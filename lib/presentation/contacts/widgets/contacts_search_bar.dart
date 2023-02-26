import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawsh_app/core/utils/debounce/debouncer.dart';

import '../bloc/contact_bloc.dart';

class ContactsSearchBar extends StatefulWidget {
  const ContactsSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactsSearchBar> createState() => _ContactsSearchBarState();
}

class _ContactsSearchBarState extends State<ContactsSearchBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onChanged: (query) {
        // search after user stops typing
        Debouncer(milliseconds: 500).run(
          () {
            if (query.isEmpty) {
              context
                  .read<ContactBloc>()
                  .add(const ContactEvent.fetchAllContacts());
            }
            
            // send search event
            context
                .read<ContactBloc>()
                .add(ContactEvent.search(searchQuery: query));
          },
        );
      },
    );
  }
}
