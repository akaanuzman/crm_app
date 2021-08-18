enum ProfileServiceEndPoints { myProfile, profile }

extension ProjectDetailServiceExtension on ProfileServiceEndPoints {
  String rawValue(String token, String username) {
    switch (this) {
      case ProfileServiceEndPoints.myProfile:
        return 'Persons/get_my_profile?token=$token';
      case ProfileServiceEndPoints.profile:
        return 'Persons/get_profile?user_name=$username&token=$token';
    }
  }
}
