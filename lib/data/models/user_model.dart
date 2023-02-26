import 'package:pawsh_app/domain/entities/user.dart';

class UserModel {
  final String id;
  final String name;
  final String joinedDate;
  final String imageUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.joinedDate,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'joinedDate': joinedDate,
      'imageUrl': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      joinedDate: map['joinedDate'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}

extension UserModeltoX on UserModel {
  User get toEntity =>
      User(id: id, name: name, joinedDate: joinedDate, imageUrl: imageUrl);
}