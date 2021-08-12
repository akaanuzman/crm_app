enum ContactServiceEndPoints { contact }

extension ContactServiceExtension on ContactServiceEndPoints {
  String  rawValue(String token) {
    switch (this) {
      case ContactServiceEndPoints.contact:
        return 'Persons/get_persons?token=$token';
    }
  }
}