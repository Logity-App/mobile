// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_sms_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsCodeRequest _$SendSmsCodeRequestFromJson(Map<String, dynamic> json) =>
    SendSmsCodeRequest(
      code: json['smsCode'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$SendSmsCodeRequestToJson(SendSmsCodeRequest instance) =>
    <String, dynamic>{
      'smsCode': instance.code,
      'phone': instance.phone,
    };

SendSmsCodeResponse _$SendSmsCodeResponseFromJson(Map<String, dynamic> json) =>
    SendSmsCodeResponse(
      status: json['status'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$SendSmsCodeResponseToJson(
        SendSmsCodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
    };
