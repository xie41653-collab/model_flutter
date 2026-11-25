/// ProgressReportDto：上报播放进度。
class ProgressReportRequest {
  /// 剧目 ID。
  final int dramaId;

  /// 分集 ID。
  final int episodeId;

  /// 已播放进度（秒）；可选。-1 表示首帧未出现即退出（加载中）。
  final int? progressSec;

  const ProgressReportRequest({
    required this.dramaId,
    required this.episodeId,
    this.progressSec,
  });

  Map<String, dynamic> toJson() => {
    'dramaId': dramaId,
    'episodeId': episodeId,
    if (progressSec != null) 'progressSec': progressSec,
  };
}
