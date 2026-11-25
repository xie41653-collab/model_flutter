/// 投票提交结果（DramaVoteResponse）。
class DramaVoteResponse {
  /// 当前用户是否已投 I WANT MORE；choice=2 时为 false。
  final bool? votedFlag;

  const DramaVoteResponse({this.votedFlag});

  factory DramaVoteResponse.fromJson(Map<String, dynamic> json) {
    return DramaVoteResponse(votedFlag: _readBool(json['votedFlag']));
  }

  Map<String, dynamic> toJson() => {'votedFlag': votedFlag};

  static bool? _readBool(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is num) return v != 0;
    final text = '$v'.trim().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return null;
  }
}
