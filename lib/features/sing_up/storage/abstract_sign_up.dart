abstract class SignUpStorageContract {
  Future<void> setPhoneSmsCode(String smsCode, String phone);
  Future<void> setDurationTimer(int durationTimer);
  Future<int> getDurationTimer();

  Future<String> getSmsCode();
  Future<String> getPhone();

  Future<void> remove();
}
