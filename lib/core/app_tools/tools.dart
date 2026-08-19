import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polyread/models/base_models/select_model.dart';

class Tools {
  static List<SelectModel> get bookCateorys => [
        SelectModel(key: "", value: "all".tr),
        SelectModel(key: "Children", value: "category_children".tr),
        SelectModel(key: "Adventure", value: "category_adventure".tr),
        SelectModel(key: "Science fiction", value: "category_sci_fi".tr),
        SelectModel(key: "Education", value: "category_education".tr),
        SelectModel(key: "Biography", value: "category_biographies".tr),
        SelectModel(key: "Philosophy", value: "category_philosophy".tr),
      ];
  static List<SelectModel> get progresStatus => [
        SelectModel(key: "", value: "all".tr),
        SelectModel(key: "notStarted", value: "status_not_started".tr),
        SelectModel(key: "continue", value: "status_continuing".tr),
        SelectModel(key: "done", value: "status_done".tr),
      ];

  static List<SelectModel> get languges => [
        SelectModel(key: "en", key2: "US", value: "lang_en".tr),
        SelectModel(key: "de", key2: "DE", value: "lang_de".tr),
        SelectModel(key: "fr", key2: "FR", value: "lang_fr".tr),
        SelectModel(key: "es", key2: "ES", value: "lang_es".tr),
        SelectModel(key: "it", key2: "IT", value: "lang_it".tr),
        SelectModel(key: "tr", key2: "TR", value: "lang_tr".tr),
      ];
  static List<DropdownMenuItem<String>> get selectLanguges => languges
      .map((l) => DropdownMenuItem(value: l.key, child: Text(l.value)))
      .toList();
}

