// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TopForecastingModel {
  final double whichDay;
  final double value;
  const TopForecastingModel({
    required this.whichDay,
    required this.value,
  });

  TopForecastingModel copyWith({
    double? whichDay,
    double? value,
  }) {
    return TopForecastingModel(
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

  factory TopForecastingModel.fromMap(Map<String, dynamic> map) {
    return TopForecastingModel(
      whichDay: map['whichDay'] as double,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopForecastingModel.fromJson(String source) =>
      TopForecastingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForecastingModel(whichDay: $whichDay, value: $value)';

  @override
  bool operator ==(covariant TopForecastingModel other) {
    if (identical(this, other)) return true;

    return other.whichDay == whichDay && other.value == value;
  }

  @override
  int get hashCode => whichDay.hashCode ^ value.hashCode;
}
