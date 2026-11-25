import 'home_section.dart';

/// HomeFeed：首页主 Feed 横条。
///
/// 含原有 [forYou] / [topChart] / [newReleased]，
/// 以及新增 [earlyAccess]（会员提前看，当前窗口内全部剧目）。
/// 无内容时 [HomeSection.items] 为空数组，不为 null。
class HomeFeed {
  /// 会员提前看专区；旧版客户端可忽略此字段。
  final HomeSection? earlyAccess;

  /// For You 分区。
  final HomeSection? forYou;

  /// New Releases 分区。
  final HomeSection? newReleased;

  /// Top Chart 分区。
  final HomeSection? topChart;

  const HomeFeed({
    this.earlyAccess,
    this.forYou,
    this.newReleased,
    this.topChart,
  });

  factory HomeFeed.fromJson(Map<String, dynamic> json) {
    return HomeFeed(
      earlyAccess: _parseStrip(json['earlyAccess']),
      forYou: _parseStrip(json['forYou']),
      newReleased: _parseStrip(json['newReleased']),
      topChart: _parseStrip(json['topChart']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'earlyAccess': earlyAccess?.toJson(),
      'forYou': forYou?.toJson(),
      'newReleased': newReleased?.toJson(),
      'topChart': topChart?.toJson(),
    };
  }

  static HomeSection? _parseStrip(dynamic raw) {
    if (raw is! Map) return null;
    return HomeSection.fromJson(Map<String, dynamic>.from(raw));
  }
}
