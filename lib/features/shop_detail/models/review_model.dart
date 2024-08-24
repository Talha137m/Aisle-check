class ReviewModel {
  final String image;
  final String name;
  final String date;
  final double totalStars;
  final String reviewText;
  const ReviewModel({
    required this.image,
    required this.totalStars,
    required this.name,
    required this.date,
    required this.reviewText,
  });
}
