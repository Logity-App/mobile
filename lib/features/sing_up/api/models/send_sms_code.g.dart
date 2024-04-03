// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsCodeRequest _$SendSmsCodeRequestFromJson(Map<String, dynamic> json) =>
    SendSmsCodeRequest(
      code: json['code'] as String,
    );

Map<String, dynamic> _$SendSmsCodeRequestToJson(SendSmsCodeRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

SendSmsCodeResponse _$SendSmsCodeResponseFromJson(Map<String, dynamic> json) =>
    SendSmsCodeResponse(
      status: json['code'] as String,
      expiredAt: DateTime.parse(json['expired_at'] as String),
    );

Map<String, dynamic> _$SendSmsCodeResponseToJson(
        SendSmsCodeResponse instance) =>
    <String, dynamic>{
      'code': instance.status,
      'expired_at': instance.expiredAt.toIso8601String(),
    };
