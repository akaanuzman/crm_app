enum ProfileServiceEndPoints { profile }

extension ProjectDetailServiceExtension on ProfileServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case ProfileServiceEndPoints.profile:
        return 'Persons/get_my_profile?token=$token';
    }
  }
}