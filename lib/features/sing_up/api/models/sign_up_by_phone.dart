import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_by_phone.g.dart';

@JsonSerializable()
class SignUpByPhoneRequest extends Equatable {
  @JsonKey(name: "phone")
  final String phone;

  @JsonKey(name: "default_tag")
  final String defaultTag;

  @JsonKey(name: "birth_day")
  final String birthDay;

  const SignUpByPhoneRequest(
      {required this.phone, required this.defaultTag, required this.birthDay});

  @override
  List<Object?> get props => [phone, birthDay, defaultTag];

  factory SignUpByPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpByPhoneRequestFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpByPhoneRequestToJson(this);
}

@JsonSerializable()
class SignUpByPhoneResponse extends Equatable {
  @JsonKey(name: "id")
  final String id;

  const SignUpByPhoneResponse({required this.id});

  @override
  List<Object?> get props => [id];

  factory SignUpByPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpByPhoneResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpByPhoneResponseToJson(this);
}
