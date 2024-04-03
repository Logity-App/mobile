// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_new_phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyNewPhoneNumberRequest _$VerifyNewPhoneNumberRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyNewPhoneNumberRequest(
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$VerifyNewPhoneNumberRequestToJson(
        VerifyNewPhoneNumberRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

VerifyNewPhoneNumberResponse _$VerifyNewPhoneNumberResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyNewPhoneNumberResponse(
      status: json['status'] as String?,
      code: json['sms_code'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$VerifyNewPhoneNumberResponseToJson(
        VerifyNewPhoneNumberResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'sms_code': instance.code,
      'error': instance.error,
    };
