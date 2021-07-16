class ProjectDetailModel {
  int id;
  String name;
  DateTime sDate;
  DateTime fDate;
  String detail;

  ProjectDetailModel({
    required this.id,
    required this.name,
    required this.sDate,
    required this.fDate,
    required this.detail,
  });

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailModel(
      id: json['id'],
      name: json['name'],
      sDate: json['s_date'],
      fDate: json['f_date'],
      detail: json['detail'],
    );
  }
}
