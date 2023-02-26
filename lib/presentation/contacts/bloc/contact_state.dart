part of 'contact_bloc.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState({
    required List<User> contacts,
    required bool isLoading,
    required bool isError,
  }) = _ContactsState;


   factory ContactState.initial() => const ContactState(contacts: [], isLoading: false, isError: false);
  
}
