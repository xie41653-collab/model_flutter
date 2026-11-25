/// 首页轮播条（HomeBanner）。
class HomeBanner {
  /// 关联剧目 ID。
  final int? dramaId;

  /// 轮播记录主键。
  final int? id;

  /// 封面/海报 URL（可由关联剧目封面带出）。
  final String? posterUrl;

  /// 预览视频 URL。
  final String? previewVideoUrl;

  /// 叠加标签文案。
  final String? tagsOverlay;

  /// 叠加标题文案。
  final String? titleOverlay;

  const HomeBanner({
    this.dramaId,
    this.id,
    this.posterUrl,
    this.previewVideoUrl,
    this.tagsOverlay,
    this.titleOverlay,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) {
    return HomeBanner(
      dramaId: json['dramaId'] is num
          ? (json['dramaId'] as num).toInt()
          : int.tryParse('${json['dramaId']}'),
      id: json['id'] is num
          ? (json['id'] as num).toInt()
          : int.tryParse('${json['id']}'),
      posterUrl: json['posterUrl']?.toString(),
      previewVideoUrl: json['previewVideoUrl']?.toString(),
      tagsOverlay: json['tagsOverlay']?.toString(),
      titleOverlay: json['titleOverlay']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dramaId': dramaId,
      'id': id,
      'posterUrl': posterUrl,
      'previewVideoUrl': previewVideoUrl,
      'tagsOverlay': tagsOverlay,
      'titleOverlay': titleOverlay,
    };
  }
}
