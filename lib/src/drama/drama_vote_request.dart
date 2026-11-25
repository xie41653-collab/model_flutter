/// DramaVoteSubmitDto：剧目投票弹窗提交。
class DramaVoteRequest {
  /// 1=投票（I WANT MORE）。
  final int choice;

  /// 剧目 ID。
  final int dramaId;

  const DramaVoteRequest({required this.choice, required this.dramaId});

  Map<String, dynamic> toJson() => {'choice': choice, 'dramaId': dramaId};
}
