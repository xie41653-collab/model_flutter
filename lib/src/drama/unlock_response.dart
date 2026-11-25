import 'episode.dart';

/// 解锁成功结果（UnlockResponse）。
class UnlockResponse {
  /// 扣费后金币余额。
  final int? balanceAfter;

  /// 本次是否使用了免费支线权益解锁（true 时一般不扣金币）。
  final bool? freeBranchUnlockUsed;

  /// 解锁后的分集信息。
  final Episode? episode;

  const UnlockResponse({
    this.balanceAfter,
    this.freeBranchUnlockUsed,
    this.episode,
  });

  factory UnlockResponse.fromJson(Map<String, dynamic> json) {
    return UnlockResponse(
      balanceAfter: _readInt(json['balanceAfter']),
      freeBranchUnlockUsed: _readBool(json['freeBranchUnlockUsed']),
      episode: json['episode'] is Map
          ? Episode.fromJson(Map<String, dynamic>.from(json['episode'] as Map))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'balanceAfter': balanceAfter,
    'freeBranchUnlockUsed': freeBranchUnlockUsed,
    'episode': episode?.toJson(),
  };

  static int? _readInt(dynamic v) {
    if (v is num) return v.toInt();
    return int.tryParse('$v');
  }

  static bool? _readBool(dynamic v) {
    if (v is bool) return v;
    if (v is num) return v != 0;
    final text = '$v'.trim().toLowerCase();
    if (text == 'true' || text == '1') return true;
    if (text == 'false' || text == '0') return false;
    return null;
  }
}
