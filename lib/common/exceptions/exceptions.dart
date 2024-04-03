class AppExpection implements Exception {
  String cause;
  AppExpection(this.cause);
}

class UserException extends AppExpection {
  UserException(String cause) : super(cause);
}

class SystemException extends AppExpection {
  SystemException(String cause) : super(cause);
}

class InternalException extends AppExpection {
  InternalException(String cause) : super(cause);
}
