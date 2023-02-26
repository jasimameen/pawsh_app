part of 'contact_bloc.dart';

@freezed
class ContactEvent with _$ContactEvent {
  const factory ContactEvent.fetchAllContacts() = _FetchAllContacts;

  const factory ContactEvent.search({required String searchQuery}) = _Search;
}
