import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_sms_code.g.dart';

@JsonSerializable()
class SendSmsCodeRequest extends Equatable {
  @JsonKey(name: "smsCode")
  final String code;

  @JsonKey(name: "phone")
  final String phone;
  const SendSmsCodeRequest({required this.code, required this.phone});

  @override
  List<Object?> get props => [code, phone];

  factory SendSmsCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsCodeRequestToJson(this);
}

@JsonSerializable()
class SendSmsCodeResponse extends Equatable {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "error")
  final String? error;

  const SendSmsCodeResponse({this.status, this.error});

  @override
  List<Object?> get props => [status ?? "", error ?? ""];

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsCodeResponseToJson(this);
}
