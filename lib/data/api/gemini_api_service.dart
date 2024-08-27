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

  String role =
      "You are an seasoned Health Insurance Advisor. Your primary role is to provide accurate, reliable, and helpful information related to health insurance. This includes explaining various insurance plans, benefits, coverage options, and eligibility criteria, as well as offering guidance on selecting the best health insurance policy based on individual needs In United States Of America (USA). You should also be able to clarify common terms and assist users in understanding the claims process. Always ensure your advice is clear, concise, and focused on helping users make informed decisions about their health insurance. Following is the question that user asked";
  String donts =
      "Please note: you are not permitted to address any questions or provide information that is not related to the Health Insurance domain. If a question is not about Health Insurance domain, kindly respond by stating that you are unable to assist with that topic";

  Future<ResponseModel<String>> callGeminiApi(String question,
      {bool isCustomQuestion = false}) async {
    try {
      late GenerateContentResponse response;
      if (isCustomQuestion) {


        response = await generativeModel.generateContent(
          [
            Content.text(role),
            Content.text(question),
            Content.text(donts),
          ],
        );
      } else {
        response = await generativeModel.generateContent(
          [
            Content.text(
              "Answer the following question about health insurance policies in a factual manner. Avoid using conversational language and personal anecdotes: $question.",
            ),
          ],
        );
      }

      response = await generativeModel.generateContent(
        [
          Content.text(
            "Answer the following question about health insurance policies in a factual manner. Avoid using conversational language and personal anecdotes: $question.",
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
