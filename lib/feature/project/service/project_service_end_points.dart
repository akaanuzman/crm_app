enum ProjectServiceEndPoints { PROJECT }

extension ProjectServiceExtension on ProjectServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case ProjectServiceEndPoints.PROJECT:
        return 'Projects/get_projects?token=$token';
    }
  }
}