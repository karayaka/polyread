import 'package:flutter/material.dart';
import 'package:polyread/models/base_models/select_model.dart';

class Tools {
  static List<SelectModel> bookCateorys = [
    SelectModel(key: "", value: "Tümü"),
    SelectModel(key: "Children", value: "Çoçuk"),
    SelectModel(key: "Adventure", value: "Macera"),
    SelectModel(key: "Science fiction", value: "Bilim Kurgu"),
    SelectModel(key: "Education", value: "Eğitim"),
    SelectModel(key: "Biography", value: "Biyografiler"),
    SelectModel(key: "Philosophy", value: "Felsefe"),
  ];
  static List<SelectModel> progresStatus = [
    SelectModel(key: "", value: "Tümü"),
    SelectModel(key: "notStarted", value: "Başlamadı"),
    SelectModel(key: "continue", value: "Devam Ediyor"),
    SelectModel(key: "done", value: "Bitti"),
  ];

  static List<SelectModel> languges = [
    SelectModel(key: "en", key2: "US", value: "İngilizce"),
    SelectModel(key: "de", key2: "DE", value: "Almanca"),
    SelectModel(key: "fr", key2: "FR", value: "Fransızca"),
    SelectModel(key: "it", key2: "IT", value: "Italyanca"),
    SelectModel(key: "tr", key2: "TR", value: "Türkçe"),
  ];
  static List<DropdownMenuItem<String>> selectLanguges = languges
      .map((l) => DropdownMenuItem(value: l.key, child: Text(l.value)))
      .toList();
}
