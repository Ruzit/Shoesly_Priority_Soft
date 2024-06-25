enum Gender { male, female, unisex }

extension GenderExtension on Gender {
  String get value {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.unisex:
        return 'Unisex';
    }
  }
}
