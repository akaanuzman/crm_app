class ProjectModel {
  int id;
  String name;
  int usersId;
  String document;
  String detail;
  String link;
  String access;
  int isActive;

  ProjectModel(
      {required this.id,
      required this.name,
      required this.usersId,
      required this.document,
      required this.detail,
      required this.link,
      required this.access,
      required this.isActive});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        id: json['id'],
        name: json['name'],
        usersId: json['users_id'],
        document: json['document'],
        detail: json['detail'],
        link: json['link'],
        access: json['access'],
        isActive: int.parse(json['is_active']));
  }
}
