import 'package:mobile/common/exceptions/exceptions.dart';

class ResponseErrorException extends UserException {
  ResponseErrorException(String cause)
      : super("response contains error: $cause");
}

class ResponseFailureException extends SystemException {
  ResponseFailureException(String cause)
      : super("response fatal error: $cause");
}
