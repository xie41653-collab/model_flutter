/// 我的收藏中单部剧信息（FavoriteDrama）。
class FavoriteDrama {
  /// 角标文案（空值时端上不展示）。
  final String? cornerBadge;

  /// 封面图 URL。
  final String? coverUrl;

  /// 剧目 ID。
  final int? dramaId;

  /// 剧目标题。
  final String? dramaTitle;

  /// 收藏时间（毫秒时间戳）。
  final int? favoriteAt;

  /// 上次观看的分集 ID。
  final int? lastEpisodeId;

  /// 上次播放时间（毫秒时间戳）。
  final int? lastPlayedAt;

  const FavoriteDrama({
    this.cornerBadge,
    this.coverUrl,
    this.dramaId,
    this.dramaTitle,
    this.favoriteAt,
    this.lastEpisodeId,
    this.lastPlayedAt,
  });

  factory FavoriteDrama.fromJson(Map<String, dynamic> json) {
    return FavoriteDrama(
      cornerBadge: json['cornerBadge']?.toString(),
      coverUrl: json['coverUrl']?.toString(),
      dramaId: _readInt(json['dramaId']),
      dramaTitle: json['dramaTitle']?.toString(),
      favoriteAt: _readInt(json['favoriteAt']),
      lastEpisodeId: _readInt(json['lastEpisodeId']),
      lastPlayedAt: _readInt(json['lastPlayedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cornerBadge': cornerBadge,
      'coverUrl': coverUrl,
      'dramaId': dramaId,
      'dramaTitle': dramaTitle,
      'favoriteAt': favoriteAt,
      'lastEpisodeId': lastEpisodeId,
      'lastPlayedAt': lastPlayedAt,
    };
  }

  static int? _readInt(dynamic value) {
    if (value is num) return value.toInt();
    return int.tryParse('$value');
  }
}
