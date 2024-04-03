// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_by_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpByPhoneRequest _$SignUpByPhoneRequestFromJson(
        Map<String, dynamic> json) =>
    SignUpByPhoneRequest(
      phone: json['phone'] as String,
      defaultTag: json['default_tag'] as String,
      birthDay: json['birth_day'] as String,
    );

Map<String, dynamic> _$SignUpByPhoneRequestToJson(
        SignUpByPhoneRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'default_tag': instance.defaultTag,
      'birth_day': instance.birthDay,
    };

SignUpByPhoneResponse _$SignUpByPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    SignUpByPhoneResponse(
      id: json['id'] as String,
    );

Map<String, dynamic> _$SignUpByPhoneResponseToJson(
        SignUpByPhoneResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
