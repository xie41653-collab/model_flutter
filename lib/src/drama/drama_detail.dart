/// 剧目详情（DramaDetail）。
///
/// 提前看准入由首页 `earlyAccess` 专栏与播放接口处理；
/// 普通用户在专栏前端拦截时不应调用本接口，故不返回 `accessState` / `publicReleaseAt` 等提前看字段。
class DramaDetail {
  /// 角标文案（空值时端上不展示）。
  final String? cornerBadge;

  /// 封面图 URL。
  final String? coverUrl;

  /// 当前用户是否已收藏该剧。
  final bool? favoriteFlag;

  /// 热度分。
  final num? heatScore;

  /// 剧目 ID。
  final int? id;

  /// 该剧是否参与投票（运营配置）。
  final bool? participateInVoting;

  /// 从第几集（含）开始付费。
  final int? paywallStartEpisodeNo;

  /// 副标题。
  final String? subtitle;

  /// 剧情简介。
  final String? summary;

  /// 标签展示文案列表。
  final List<String>? tags;

  /// 标题。
  final String? title;

  /// 总集数（展示用）。
  final int? totalEpisodes;

  /// 当前用户是否已投 I WANT MORE。
  final bool? votedFlag;

  const DramaDetail({
    this.cornerBadge,
    this.coverUrl,
    this.favoriteFlag,
    this.heatScore,
    this.id,
    this.participateInVoting,
    this.paywallStartEpisodeNo,
    this.subtitle,
    this.summary,
    this.tags,
    this.title,
    this.totalEpisodes,
    this.votedFlag,
  });

  DramaDetail copyWith({bool? votedFlag}) {
    return DramaDetail(
      cornerBadge: cornerBadge,
      coverUrl: coverUrl,
      favoriteFlag: favoriteFlag,
      heatScore: heatScore,
      id: id,
      participateInVoting: participateInVoting,
      paywallStartEpisodeNo: paywallStartEpisodeNo,
      subtitle: subtitle,
      summary: summary,
      tags: tags,
      title: title,
      totalEpisodes: totalEpisodes,
      votedFlag: votedFlag ?? this.votedFlag,
    );
  }

  factory DramaDetail.fromJson(Map<String, dynamic> json) {
    return DramaDetail(
      cornerBadge: json['cornerBadge']?.toString(),
      coverUrl: json['coverUrl']?.toString(),
      favoriteFlag: _readBool(json['favoriteFlag']),
      heatScore: json['heatScore'] is num
          ? json['heatScore'] as num
          : num.tryParse('${json['heatScore']}'),
      id: _readInt(json['id']),
      participateInVoting: _readBool(json['participateInVoting']),
      paywallStartEpisodeNo: _readInt(json['paywallStartEpisodeNo']),
      subtitle: json['subtitle']?.toString(),
      summary: json['summary']?.toString(),
      tags: json['tags'] is List
          ? (json['tags'] as List<dynamic>).map((e) => e.toString()).toList()
          : null,
      title: json['title']?.toString(),
      totalEpisodes: _readInt(json['totalEpisodes']),
      votedFlag: _readBool(json['votedFlag']),
    );
  }

  Map<String, dynamic> toJson() => {
    'cornerBadge': cornerBadge,
    'coverUrl': coverUrl,
    'favoriteFlag': favoriteFlag,
    'heatScore': heatScore,
    'id': id,
    'participateInVoting': participateInVoting,
    'paywallStartEpisodeNo': paywallStartEpisodeNo,
    'subtitle': subtitle,
    'summary': summary,
    'tags': tags,
    'title': title,
    'totalEpisodes': totalEpisodes,
    'votedFlag': votedFlag,
  };

  static int? _readInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.toInt();
    return int.tryParse('$v');
  }

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
