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
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

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
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  factory SignUpByPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpByPhoneResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpByPhoneResponseToJson(this);
}
