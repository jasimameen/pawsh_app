import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawsh_app/domain/usecases/get_all_users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pawsh_app/domain/usecases/search_users.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../domain/entities/user.dart';

part 'contact_event.dart';
part 'contact_state.dart';
part 'contact_bloc.freezed.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetAllUsers _getAllUsers;
  final SearchUsers _searchUsers;

  ContactBloc(this._getAllUsers, this._searchUsers)
      : super(ContactState.initial()) {
    on<_FetchAllContacts>((event, emit) async {
      // send loading state
      emit(state.copyWith(isLoading: true));

      // get data
      final resp = await _getAllUsers(NoParams());
      emit(resp.fold(
        (failure) => state.copyWith(isLoading: false, isError: true),
        (contacts) => state.copyWith(
          isLoading: false,
          isError: false,
          contacts: contacts,
        ),
      ));
    });

    on<_Search>((event, emit) async {
      // send loading state
      emit(state.copyWith(isLoading: true));

      // get search data
      final searchRes = state.contacts
          .where((element) => element
              .toString()
              .toLowerCase()
              .contains(event.searchQuery.toLowerCase()))
          .toList();

      emit(
        state.copyWith(
          isLoading: false,
          isError: false,
          contacts: searchRes,
        ),
      );
    });
  }
}
