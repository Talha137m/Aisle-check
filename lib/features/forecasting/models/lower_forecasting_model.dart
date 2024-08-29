// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LowerForecastingModel {
  final double whichDay;
  final double value;
  const LowerForecastingModel({
    required this.whichDay,
    required this.value,
  });

  LowerForecastingModel copyWith({
    double? whichDay,
    double? value,
  }) {
    return LowerForecastingModel(
      whichDay: whichDay ?? this.whichDay,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'whichDay': whichDay,
      'value': value,
    };
  }

  factory LowerForecastingModel.fromMap(Map<String, dynamic> map) {
    return LowerForecastingModel(
      whichDay: map['whichDay'] as double,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LowerForecastingModel.fromJson(String source) =>
      LowerForecastingModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LowerForecastingModel(whichDay: $whichDay, value: $value)';

  @override
  bool operator ==(covariant LowerForecastingModel other) {
    if (identical(this, other)) return true;

    return other.whichDay == whichDay && other.value == value;
  }

  @override
  int get hashCode => whichDay.hashCode ^ value.hashCode;
}
