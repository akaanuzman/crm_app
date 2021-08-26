enum ProjectDetailServiceEndPoints { project }

extension ProjectDetailServiceExtension on ProjectDetailServiceEndPoints {
  String  rawValue(String token,String projectId) {
    switch (this) {
      case ProjectDetailServiceEndPoints.project:
        return 'Projects/get_project_detail?project_id=$projectId&token=$token';
    }
  }
}