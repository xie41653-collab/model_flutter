/// PlayPreviewDto：播放预览请求。
class PlayPreviewRequest {
  /// 剧目 ID。
  final int dramaId;

  /// 当前分集 ID。
  final int episodeId;

  const PlayPreviewRequest({required this.dramaId, required this.episodeId});

  Map<String, dynamic> toJson() => {'dramaId': dramaId, 'episodeId': episodeId};
}
