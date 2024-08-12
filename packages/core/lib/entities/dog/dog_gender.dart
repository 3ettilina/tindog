enum DogGender {
  male(),
  female();

  @override
  String toString() {
    return name;
  }

  factory DogGender.fromString(String gender) {
    switch (gender) {
      case 'female':
        return DogGender.female;
      default:
        return DogGender.male;
    }
  }
}
