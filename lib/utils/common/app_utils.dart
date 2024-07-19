import 'package:valley_well/data/models/valley_well_model.dart';

class AppUtils {
  AppUtils._internal();

  static final AppUtils _instance = AppUtils._internal();

  static AppUtils get instance => _instance;

  List<ValleyWellModel> questionAnswerModelList = [
    ValleyWellModel(
      question: "What is a premium in the context of health insurance?",
    ),
    ValleyWellModel(
      question: "How does a deductible affect your health insurance coverage?",
    ),
    ValleyWellModel(
      question: "What is a copayment (copay), and when is it typically required?",
    ),
    ValleyWellModel(
      question: "What is the difference between in-network and out-of-network providers?",
    ),
    ValleyWellModel(
      question: "What is an out-of-pocket maximum, and what expenses contribute to reaching it?",
    ),
    ValleyWellModel(
      question: "What is the difference between an HMO and a PPO health insurance plan?",
    ),
    ValleyWellModel(
      question: "What is a health savings account (HSA), and how can it be used?",
    ),
    ValleyWellModel(
      question:
          "What are the implications of not having health insurance coverage under the individual mandate or letting your health insurance coverage lapse?",
    ),
    ValleyWellModel(
      question: "How do special enrollment periods differ from open enrollment periods?",
    ),
    ValleyWellModel(
      question: "How can you appeal a denied claim from your health insurance provider?",
    ),
  ];
}
