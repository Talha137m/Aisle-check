// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class OnBordingModel {
 final String heading;
  final String subHeading;
  final String imagePath;
  const OnBordingModel({
    required this.heading,
    required this.subHeading,
    required this.imagePath,
  });

  OnBordingModel copyWith({
    String? heading,
    String? subHeading,
    String? imagePath,
  }) {
    return OnBordingModel(
      heading: heading ?? this.heading,
      subHeading: subHeading ?? this.subHeading,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'heading': heading,
      'subHeading': subHeading,
      'imagePath': imagePath,
    };
  }

  factory OnBordingModel.fromMap(Map<String, dynamic> map) {
    return OnBordingModel(
      heading: map['heading'] as String,
      subHeading: map['subHeading'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnBordingModel.fromJson(String source) =>
      OnBordingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OnBordingModel(heading: $heading, subHeading: $subHeading, imagePath: $imagePath)';

  @override
  bool operator ==(covariant OnBordingModel other) {
    if (identical(this, other)) return true;

    return other.heading == heading &&
        other.subHeading == subHeading &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode =>
      heading.hashCode ^ subHeading.hashCode ^ imagePath.hashCode;
}
