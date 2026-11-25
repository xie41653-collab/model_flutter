/// 卡片点击建议动作（DramaCard.actionType）。
///
/// OPEN_DRAMA=打开剧目；SUBSCRIBE=去订阅；WAIT_PUBLIC=等待公开发布。
enum DramaCardAction { openDrama, subscribe, waitPublic }

extension DramaCardActionCodec on DramaCardAction {
  String get apiValue {
    switch (this) {
      case DramaCardAction.openDrama:
        return 'OPEN_DRAMA';
      case DramaCardAction.subscribe:
        return 'SUBSCRIBE';
      case DramaCardAction.waitPublic:
        return 'WAIT_PUBLIC';
    }
  }

  static DramaCardAction? fromApi(String? raw) {
    switch (raw?.trim().toUpperCase()) {
      case 'OPEN_DRAMA':
        return DramaCardAction.openDrama;
      case 'SUBSCRIBE':
        return DramaCardAction.subscribe;
      case 'WAIT_PUBLIC':
        return DramaCardAction.waitPublic;
      default:
        return null;
    }
  }
}

/// DramaCard：首页/分区剧目卡片。
class DramaCard {
  /// 访问状态。
  final String? accessState;

  /// 卡片点击建议动作。
  final DramaCardAction? actionType;

  /// 角标文案，空值时端上不展示。
  final String? cornerBadge;

  /// 封面 URL。
  final String? coverUrl;

  /// 剧目主键。
  final int? dramaId;

  /// 后台配置的会员提前看天数（固定，不倒计时）；非提前看卡片为空。
  final int? earlyAccessDays;

  /// 是否已收藏。
  final bool? favoriteFlag;

  /// 热度分。
  final num? heatScore;

  /// 短简介。
  final String? intro;

  /// 点赞数。
  final int? likeCount;

  /// 累计播放次数。
  final int? playCount;

  /// 非会员公开时间（毫秒）；可用其与当前时间算剩余时长。
  final int? publicReleaseAt;

  /// 最近播放集 ID。
  final int? resumeEpisodeId;

  /// 运营标签展示文案。
  final List<String>? tags;

  /// 主标题。
  final String? title;

  /// 总集数。
  final int? totalEpisodes;

  const DramaCard({
    this.accessState,
    this.actionType,
    this.cornerBadge,
    this.coverUrl,
    this.dramaId,
    this.earlyAccessDays,
    this.favoriteFlag,
    this.heatScore,
    this.intro,
    this.likeCount,
    this.playCount,
    this.publicReleaseAt,
    this.resumeEpisodeId,
    this.tags,
    this.title,
    this.totalEpisodes,
  });

  factory DramaCard.fromJson(Map<String, dynamic> json) {
    return DramaCard(
      accessState: json['accessState']?.toString(),
      actionType: DramaCardActionCodec.fromApi(json['actionType']?.toString()),
      cornerBadge: json['cornerBadge']?.toString(),
      coverUrl: json['coverUrl']?.toString(),
      dramaId: _readInt(json['dramaId']),
      earlyAccessDays: _readInt(json['earlyAccessDays']),
      favoriteFlag: _readBool(json['favoriteFlag']),
      heatScore: json['heatScore'] is num
          ? json['heatScore'] as num
          : num.tryParse('${json['heatScore']}'),
      intro: json['intro']?.toString(),
      likeCount: _readInt(json['likeCount']),
      playCount: _readInt(json['playCount']),
      publicReleaseAt: _readInt(json['publicReleaseAt']),
      resumeEpisodeId: _readInt(json['resumeEpisodeId']),
      tags: json['tags'] is List
          ? (json['tags'] as List).map((e) => e.toString()).toList()
          : null,
      title: json['title']?.toString(),
      totalEpisodes: _readInt(json['totalEpisodes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessState': accessState,
      'actionType': actionType?.apiValue,
      'cornerBadge': cornerBadge,
      'coverUrl': coverUrl,
      'dramaId': dramaId,
      'earlyAccessDays': earlyAccessDays,
      'favoriteFlag': favoriteFlag,
      'heatScore': heatScore,
      'intro': intro,
      'likeCount': likeCount,
      'playCount': playCount,
      'publicReleaseAt': publicReleaseAt,
      'resumeEpisodeId': resumeEpisodeId,
      'tags': tags,
      'title': title,
      'totalEpisodes': totalEpisodes,
    };
  }

  static bool? _readBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is num) return value != 0;
    switch (value.toString().trim().toLowerCase()) {
      case 'true':
      case '1':
        return true;
      case 'false':
      case '0':
        return false;
      default:
        return null;
    }
  }

  static int? _readInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
