import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:isar/isar.dart';
import 'package:valley_well/data/api/gemini_api_service.dart';
import 'package:valley_well/data/database/valley_well_database.dart';
import 'package:valley_well/data/models/valley_well_model.dart';

import 'package:valley_well/domain/repository/valley_well_repository.dart';

import '../data/repository/gemini_repository_impl.dart';

Future<void> setupDependencies(Directory directory) async {
  final apiKey = dotenv.env['GEMINI_API_KEY'];

  final isarDatabase = await Isar.open(
    [
      ValleyWellModelSchema,
    ],
    directory: directory.path,
  );

  final generativeModel = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: apiKey.toString(),
  );

  GetIt.I.registerLazySingleton<Isar>(
    () => isarDatabase,
  );

  GetIt.I.registerLazySingleton<ValleyWellDatabase>(
    () => ValleyWellDatabase(
      isarDatabase,
    ),
  );

  GetIt.I.registerSingleton<GenerativeModel>(
    generativeModel,
  );

  GetIt.I.registerSingleton<GeminiApiService>(
    GeminiApiService(
      generativeModel,
    ),
  );

  GetIt.I.registerLazySingleton<ValleyWellRepository>(
    () => ValleyWellRepositoryImpl(
      GetIt.I<GeminiApiService>(),
      GetIt.I<ValleyWellDatabase>(),
    ),
  );
}
