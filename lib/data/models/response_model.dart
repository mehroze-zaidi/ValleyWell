import 'package:valley_well/utils/enums/response_status.dart';

class ResponseModel<T> {
  final ResponseStatus responseStatus;
  final T? response;

  ResponseModel({
    required this.responseStatus,
    this.response,
  });
}
