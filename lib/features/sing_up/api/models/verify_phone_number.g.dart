// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneNumberRequest _$VerifyPhoneNumberRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneNumberRequest(
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$VerifyPhoneNumberRequestToJson(
        VerifyPhoneNumberRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

VerifyPhoneNumberResponse _$VerifyPhoneNumberResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneNumberResponse(
      smsCode: json['sms_code'] as String?,
      status: json['status'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$VerifyPhoneNumberResponseToJson(
        VerifyPhoneNumberResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sms_code': instance.smsCode,
      'error': instance.error,
    };
