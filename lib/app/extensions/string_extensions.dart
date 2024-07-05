extension StringX on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}
