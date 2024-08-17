import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return const AuthApiModel.empty();
});

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String firstName;
  final String lastName;
  final int phone;

  final String email;
  final String password;

  const AuthApiModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
  });

  const AuthApiModel.empty()
      : id = '',
        firstName = '',
        lastName = '',
        phone = 0,
        email = '',
        password = '';
  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      //image: image,
      phone: phone,
      email: email,
      password: password,
    );
  }

  AuthApiModel fromEntity(AuthEntity entity) {
    return AuthApiModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      //image: entity.image,
      phone: entity.phone,
      email: entity.email,
      password: entity.password,
    );
  }

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  @override
  List<Object?> get props => [id, firstName, lastName, phone, email, password];
}
