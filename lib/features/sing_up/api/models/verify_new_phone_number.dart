import "package:equatable/equatable.dart";
import "package:json_annotation/json_annotation.dart";

part "verify_new_phone_number.g.dart";

@JsonSerializable()
class VerifyNewPhoneNumberRequest extends Equatable {
  @JsonKey(name: "phone")
  final String phone;

  const VerifyNewPhoneNumberRequest({required this.phone});

  @override
  List<Object> get props => [phone];

  factory VerifyNewPhoneNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyNewPhoneNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyNewPhoneNumberRequestToJson(this);
}

@JsonSerializable()
class VerifyNewPhoneNumberResponse extends Equatable {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "sms_code")
  final String? code;
  @JsonKey(name: "error")
  final String? error;

  const VerifyNewPhoneNumberResponse({
    this.status,
    this.code,
    this.error,
  });

  @override
  List<Object> get props => [status ?? "", code ?? "", error ?? ""];

  factory VerifyNewPhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyNewPhoneNumberResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VerifyNewPhoneNumberResponseToJson(this);
}
