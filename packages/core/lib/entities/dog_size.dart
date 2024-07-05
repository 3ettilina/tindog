enum DogSize {
  small,
  medium,
  large;

  @override
  String toString() {
    return name;
  }

  static DogSize fromName(String name) {
    switch (name) {
      case 'small':
        return DogSize.small;
      case 'medium':
        return DogSize.medium;
      default:
        return DogSize.large;
    }
  }
}
