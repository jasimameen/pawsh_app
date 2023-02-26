import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String joinedDate;
  final String imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.joinedDate,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, name, joinedDate, imageUrl];

  @override
  bool get stringify => true;
}
