/// ActivityWatchReportDto：活动观看累计上报（真实在播整秒增量）。
class WatchReportRequest {
  /// 自上次成功上报以来真实在播的整秒数；暂停/切集/退出时应 flush 剩余秒数。
  final int deltaSec;

  /// 剧目 ID。
  final int dramaId;

  /// 分集 ID，须 > 0。
  final int episodeId;

  const WatchReportRequest({
    required this.deltaSec,
    required this.dramaId,
    required this.episodeId,
  });

  Map<String, dynamic> toJson() => {
    'deltaSec': deltaSec,
    'dramaId': dramaId,
    'episodeId': episodeId,
  };
}
