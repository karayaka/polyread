class PsFormResultModel {
  late int psId;
  late String psCfi;
  PsFormResultModel({required this.psId, required this.psCfi});
  Map<String, dynamic> toMap() {
    return {'psId': psId, 'psCfi': psCfi};
  }

  factory PsFormResultModel.fromMap(Map<String, dynamic> map) =>
      PsFormResultModel(psCfi: map["psCfi"], psId: map["psId"]);
}
