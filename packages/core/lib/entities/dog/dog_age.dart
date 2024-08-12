import 'package:equatable/equatable.dart';

enum AgeUnit {
  months(),
  years();

  @override
  String toString() {
    return name;
  }

  factory AgeUnit.fromString(String unit) {
    switch (unit) {
      case 'months':
        return AgeUnit.months;
      default:
        return AgeUnit.years;
    }
  }
}

class Age extends Equatable {
  const Age({
    required this.value,
    required this.unit,
  });

  const Age.months({required this.value}) : unit = AgeUnit.months;

  const Age.years({required this.value}) : unit = AgeUnit.years;

  final int value;
  final AgeUnit unit;

  Age copyWith({
    int? value,
    AgeUnit? unit,
  }) =>
      Age(
        value: value ?? this.value,
        unit: unit ?? this.unit,
      );

  @override
  String toString() {
    return '$value $unit';
  }

  @override
  List<Object?> get props => [value, unit];
}
