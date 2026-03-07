import 'package:polyread/models/base_models/base_http_model.dart';

class VocabularyModel extends BaseHttpModel {
  String? sourceText;
  String? detectedLanguage;
  String? translation;
  VocabularyModel({this.sourceText, this.detectedLanguage, this.translation});
  @override
  fromJson(Map<String, dynamic> map) {
    return VocabularyModel(
      sourceText: map["sourceText"],
      detectedLanguage: map["detectedLanguage"],
      translation: map["translation"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "sourceText": sourceText,
      "detectedLanguage": detectedLanguage,
      "translation": translation,
    };
  }
}
