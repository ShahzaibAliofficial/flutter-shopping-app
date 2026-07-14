class ReviewModel {
  final String comment;
  final String date;
  final double rating;
  final String reviewerName;
  final String reviewerEmail;

  ReviewModel({
    required this.comment,
    required this.date,
    required this.rating,
    required this.reviewerEmail,
    required this.reviewerName,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      comment: json['comment'],
      date: json['date'],
      reviewerEmail: json['reviewerEmail'],
      reviewerName: json['reviewerName'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
