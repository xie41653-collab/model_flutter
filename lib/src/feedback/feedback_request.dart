/// UserFeedbackSubmitDto：用户反馈提交。邮箱可选；未填表示不留联系方式。
class FeedbackRequest {
  /// 反馈正文，必填，最多 2000 字。
  final String content;

  /// 联系邮箱，可选。
  final String? email;

  const FeedbackRequest({required this.content, this.email});

  Map<String, dynamic> toJson() => {
    'content': content,
    if (email != null && email!.isNotEmpty) 'email': email,
  };
}
