import 'side_story_episode.dart';

/// 单集信息（列表 / 解锁结果等元数据；[playUrl] 仅见于 [/play/preview]）。
class Episode {
  /// 解锁所需金币；0 表示可免费。
  final int? coinPrice;

  /// 单集时长（秒）。
  final int? durationSec;

  /// 集序号（从 1 起）。
  final int? episodeIndex;

  /// 本集关联的隐藏剧情列表。
  final List<SideStoryEpisode>? hiddenPlots;

  /// 分集主键 ID。
  final int? id;

  /// 未解锁时可试看秒数。
  final int? previewSeconds;

  /// 分集标题。
  final String? title;

  /// 是否已解锁。
  final bool? unlocked;

  /// 播放地址；仅 [/play/preview] 返回。
  final String? playUrl;

  const Episode({
    this.coinPrice,
    this.durationSec,
    this.episodeIndex,
    this.hiddenPlots,
    this.id,
    this.previewSeconds,
    this.title,
    this.unlocked,
    this.playUrl,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      coinPrice: _readInt(json['coinPrice']),
      durationSec: _readInt(json['durationSec']),
      episodeIndex: _readInt(json['episodeIndex']),
      hiddenPlots: json['hiddenPlots'] is List
          ? (json['hiddenPlots'] as List<dynamic>)
                .map(
                  (e) => SideStoryEpisode.fromJson(
                    Map<String, dynamic>.from(e as Map),
                  ),
                )
                .toList()
          : null,
      id: _readInt(json['id']),
      previewSeconds: _readInt(json['previewSeconds']),
      title: json['title']?.toString(),
      unlocked: _readBool(json['unlocked']),
      playUrl: json['playUrl']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'coinPrice': coinPrice,
    'durationSec': durationSec,
    'episodeIndex': episodeIndex,
    'hiddenPlots': hiddenPlots?.map((e) => e.toJson()).toList(),
    'id': id,
    'previewSeconds': previewSeconds,
    'title': title,
    'unlocked': unlocked,
    'playUrl': playUrl,
  };

  static int? _readInt(dynamic v) {
    if (v is num) return v.toInt();
    return int.tryParse('$v');
  }

  static bool? _readBool(dynamic v) {
    if (v is bool) return v;
    if (v is num) return v != 0;
    return null;
  }
}
