enum ExperienceServiceEndPoints { experience }

extension ExperienceServiceExtension on ExperienceServiceEndPoints {
  String rawValue(String token) {
    switch (this) {
      case ExperienceServiceEndPoints.experience:
        return 'Persons/get_timeline?token=$token';
    }
  }
}
