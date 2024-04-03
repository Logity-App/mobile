import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_sms_code.g.dart';

@JsonSerializable()
class SendSmsCodeRequest extends Equatable {
  @JsonKey(name: "code")
  final String code;
  const SendSmsCodeRequest({required this.code});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  factory SendSmsCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsCodeRequestToJson(this);
}

@JsonSerializable()
class SendSmsCodeResponse extends Equatable {
  @JsonKey(name: "code")
  final String status;
  @JsonKey(name: "expired_at")
  final DateTime expiredAt;

  const SendSmsCodeResponse({required this.status, required this.expiredAt});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsCodeResponseToJson(this);
}
