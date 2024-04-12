import 'package:flutter/rendering.dart';
import 'package:mobile/features/sing_up/storage/abstract_sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

const prefix = "signup";

class SignUpStorage extends SignUpStorageContract {
  SignUpStorage();

  @override
  Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("$prefix:phone") ?? "";
  }

  @override
  Future<int> getDurationTimer() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("$prefix:duration_timer") ?? 0;
  }

  @override
  Future<String> getSmsCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("$prefix:sms_code") ?? "";
  }

  @override
  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    Future.wait([
      prefs.remove("$prefix:phone"),
      prefs.remove("$prefix:sms_code"),
    ]);
  }

  @override
  Future<void> setPhoneSmsCode(String smsCode, String phone) async {
    await Future.wait([_setPhone(phone), _setSmsCode(smsCode)]);
  }

  Future<void> _setPhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("$prefix:phone", phone);
  }

  Future<void> _setSmsCode(String smsCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("$prefix:sms_code", smsCode);
  }

  Future<void> setDurationTimer(int durationTimer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("$prefix:duration_timer", durationTimer);
  }
}
