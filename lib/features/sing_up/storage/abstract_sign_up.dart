abstract class SignUpStorageContract {
  Future<void> setPhoneSmsCode(String smsCode, String phone);

  Future<String> getSmsCode();
  Future<String> getPhone();

  Future<void> remove();
}
