import 'package:dio/dio.dart';
import 'package:mobile/features/sing_up/api/models/send_sms_code.dart';
import 'package:mobile/features/sing_up/api/models/sign_up_by_phone.dart';
import 'package:mobile/features/sing_up/api/models/verify_new_phone_number.dart';
import 'package:mobile/features/sing_up/api/models/verify_phone_number.dart';
import 'package:retrofit/retrofit.dart';

part "abstract_sign_up_repository.g.dart";

@RestApi(baseUrl: "-")
abstract class SignUpRepositoryContract {
  factory SignUpRepositoryContract(Dio dio, {String baseUrl}) =
      _SignUpRepositoryContract;

  @GET("/verify-new-phone-number/{phone}")
  Future<VerifyNewPhoneNumberResponse> verifyNewPhoneNumber(
      @Path() String phone);

  @POST("/send-sms-code")
  Future<SendSmsCodeResponse> sendSmsCode(@Body() SendSmsCodeRequest request);

  @POST("/verify-phone-number")
  Future<VerifyPhoneNumberResponse> verifyPhoneNumber(
      @Body() VerifyPhoneNumberRequest request);

  @POST("/sign-up-by-phone")
  Future<SignUpByPhoneResponse> signUpByPhone(
      @Body() SignUpByPhoneRequest request);
}
