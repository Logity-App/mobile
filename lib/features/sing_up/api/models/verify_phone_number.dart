import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_phone_number.g.dart';

@JsonSerializable()
class VerifyPhoneNumberRequest extends Equatable {
  @JsonKey(name: "phone")
  final String phone;

  const VerifyPhoneNumberRequest({required this.phone});

  @override
  List<Object> get props => [phone];

  factory VerifyPhoneNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneNumberRequestToJson(this);
}

@JsonSerializable()
class VerifyPhoneNumberResponse extends Equatable {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "sms_code")
  final String? smsCode;

  @JsonKey(name: "error")
  final String? error;

  // @JsonKey(name: "expired_at")
  // final String expiredAt;

  const VerifyPhoneNumberResponse({this.smsCode, this.status, this.error});

  @override
  List<Object> get props => [status ?? "", smsCode ?? "", error ?? ""];

  factory VerifyPhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPhoneNumberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneNumberResponseToJson(this);
}
