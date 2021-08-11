enum ProjectServiceEndPoints { project }

extension ProjectServiceExtension on ProjectServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case ProjectServiceEndPoints.project:
        return 'Projects/get_projects?token=$token';
    }
  }
}