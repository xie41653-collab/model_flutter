import 'episode.dart';

/// 播放预览：当前集 + 后续正片（PlayPreviewResponse）。
class PlayPreviewResponse {
  /// 当前播放分集（含 playUrl、隐藏剧情等）。
  final Episode? current;

  /// CDN 边缘预取地址列表。
  final List<String>? edgePrefetchUrls;

  /// 后续可播正片分集列表。
  final List<Episode>? nextEpisodes;

  const PlayPreviewResponse({
    this.current,
    this.edgePrefetchUrls,
    this.nextEpisodes,
  });

  factory PlayPreviewResponse.fromJson(Map<String, dynamic> json) {
    return PlayPreviewResponse(
      current: json['current'] is Map
          ? Episode.fromJson(Map<String, dynamic>.from(json['current'] as Map))
          : null,
      edgePrefetchUrls: json['edgePrefetchUrls'] is List
          ? (json['edgePrefetchUrls'] as List<dynamic>)
                .map((e) => e.toString())
                .toList()
          : null,
      nextEpisodes: json['nextEpisodes'] is List
          ? (json['nextEpisodes'] as List<dynamic>)
                .map(
                  (e) => Episode.fromJson(Map<String, dynamic>.from(e as Map)),
                )
                .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'current': current?.toJson(),
    'edgePrefetchUrls': edgePrefetchUrls,
    'nextEpisodes': nextEpisodes?.map((e) => e.toJson()).toList(),
  };
}
