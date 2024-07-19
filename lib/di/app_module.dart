import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:valley_well/data/api/gemini_api_service.dart';

Future<void> setupDependencies() async {
  final apiKey = dotenv.env['GEMINI_API_KEY'];

  final generativeModel = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: apiKey.toString(),
  );

  GetIt.I.registerSingleton<GenerativeModel>(
    generativeModel,
  );

  GetIt.I.registerSingleton<GeminiApiService>(
    GeminiApiService(
      generativeModel,
    ),
  );
}
