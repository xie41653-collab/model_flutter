/// 正片触发的隐藏剧情分集。
///
/// 锁价字段以 [/drama/episodes] 为准；[playUrl] 多由 [/play/preview] 补齐。
class SideStoryEpisode {
  /// 解锁所需金币；0 表示免费。
  final int? coinPrice;

  /// 视频时长（秒）。
  final int? durationSec;

  /// 隐藏剧情分集 ID（解锁/播放用）。
  final int? hiddenEpisodeId;

  /// 封面图 URL。
  final String? posterUrl;

  /// 隐藏剧情标题。
  final String? title;

  /// 正片播放到该秒数时触发提示。
  final int? triggerOffsetSec;

  /// 是否已解锁。
  final bool? unlocked;

  /// 是否可对该付费支线使用一次免费解锁；最终以 [/play/unlock] 为准。
  final bool? freeUnlockEligible;

  /// 播放地址。
  final String? playUrl;

  const SideStoryEpisode({
    this.coinPrice,
    this.durationSec,
    this.hiddenEpisodeId,
    this.posterUrl,
    this.title,
    this.triggerOffsetSec,
    this.unlocked,
    this.freeUnlockEligible,
    this.playUrl,
  });

  SideStoryEpisode copyWith({
    int? coinPrice,
    int? durationSec,
    int? hiddenEpisodeId,
    String? posterUrl,
    String? title,
    int? triggerOffsetSec,
    bool? unlocked,
    bool? freeUnlockEligible,
    String? playUrl,
  }) {
    return SideStoryEpisode(
      coinPrice: coinPrice ?? this.coinPrice,
      durationSec: durationSec ?? this.durationSec,
      hiddenEpisodeId: hiddenEpisodeId ?? this.hiddenEpisodeId,
      posterUrl: posterUrl ?? this.posterUrl,
      title: title ?? this.title,
      triggerOffsetSec: triggerOffsetSec ?? this.triggerOffsetSec,
      unlocked: unlocked ?? this.unlocked,
      freeUnlockEligible: freeUnlockEligible ?? this.freeUnlockEligible,
      playUrl: playUrl ?? this.playUrl,
    );
  }

  factory SideStoryEpisode.fromJson(Map<String, dynamic> json) {
    return SideStoryEpisode(
      coinPrice: _readInt(json['coinPrice']),
      durationSec: _readInt(json['durationSec']),
      hiddenEpisodeId: _readInt(json['hiddenEpisodeId']),
      posterUrl: json['posterUrl']?.toString(),
      title: json['title']?.toString(),
      triggerOffsetSec: _readInt(json['triggerOffsetSec']),
      unlocked: _readBool(json['unlocked']),
      freeUnlockEligible: _readBool(json['freeUnlockEligible']),
      playUrl: json['playUrl']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    'coinPrice': coinPrice,
    'durationSec': durationSec,
    'hiddenEpisodeId': hiddenEpisodeId,
    'posterUrl': posterUrl,
    'title': title,
    'triggerOffsetSec': triggerOffsetSec,
    'unlocked': unlocked,
    'freeUnlockEligible': freeUnlockEligible,
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
