/// UnlockDto：金币解锁分集请求。
class UnlockRequest {
  /// 剧目 ID。
  final int dramaId;

  /// 待解锁分集 ID。
  final int episodeId;

  const UnlockRequest({required this.dramaId, required this.episodeId});

  Map<String, dynamic> toJson() => {'dramaId': dramaId, 'episodeId': episodeId};
}
