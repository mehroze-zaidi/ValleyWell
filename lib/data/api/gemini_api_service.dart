import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:valley_well/data/models/response_model.dart';
import 'package:valley_well/utils/enums/response_status.dart';

class GeminiApiService {
  final GenerativeModel generativeModel;

  GeminiApiService(
    this.generativeModel,
  );

  Future<ResponseModel<String>> callGeminiApi(
    String question,
  ) async {
    try {
      final response = await generativeModel.generateContent(
        [
          Content.text(
            question,
          ),
        ],
      );
      if (response.text!.isNotEmpty) {
        return ResponseModel(
          responseStatus: ResponseStatus.success,
          response: response.text,
        );
      } else {
        return ResponseModel(
          responseStatus: ResponseStatus.emptyResponse,
          response: response.text!,
        );
      }
    } on SocketException {
      return ResponseModel(
        responseStatus: ResponseStatus.noInternetConnection,
      );
    } on HttpException {
      return ResponseModel(
        responseStatus: ResponseStatus.failedToConnectToServer,
      );
    } catch (e) {
      debugPrint(e.toString());
      return ResponseModel(
        responseStatus: ResponseStatus.unknownError,
      );
    }
  }
}
