class ExternalBookServiceModel {
  final String path;
  final String name;

  ExternalBookServiceModel(this.path, this.name);

  Map<String, dynamic> toJson() {
    return {"path": path, "name": name};
  }

  factory ExternalBookServiceModel.fromJson(Map<String, dynamic> json) {
    return ExternalBookServiceModel(json['path'], json['name']);
  }
}
