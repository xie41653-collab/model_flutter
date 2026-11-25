import 'drama_card.dart';

/// 「更多」等分页模块（HomePageResponse）。
class HomePageResponse {
  /// 当前页剧目卡片。
  final List<DramaCard>? items;

  /// 当前页码。
  final int? pageNo;

  /// 每页条数。
  final int? pageSize;

  /// 分区编码（与 vp_feed_section.section_code 一致）。
  final String? sectionCode;

  /// 分区标题。
  final String? sectionTitle;

  /// 总条数。
  final int? total;

  const HomePageResponse({
    this.items,
    this.pageNo,
    this.pageSize,
    this.sectionCode,
    this.sectionTitle,
    this.total,
  });

  factory HomePageResponse.fromJson(Map<String, dynamic> json) {
    return HomePageResponse(
      items: _parseItems(json['items'] ?? json['list'] ?? json['records']),
      pageNo: json['pageNo'] is num
          ? (json['pageNo'] as num).toInt()
          : int.tryParse('${json['pageNo']}'),
      pageSize: json['pageSize'] is num
          ? (json['pageSize'] as num).toInt()
          : int.tryParse('${json['pageSize']}'),
      sectionCode: json['sectionCode']?.toString(),
      sectionTitle: json['sectionTitle']?.toString(),
      total: json['total'] is num
          ? (json['total'] as num).toInt()
          : int.tryParse('${json['total']}'),
    );
  }

  static List<DramaCard>? _parseItems(dynamic raw) {
    if (raw is! List) return null;
    final out = <DramaCard>[];
    for (final entry in raw) {
      if (entry is! Map) continue;
      try {
        out.add(DramaCard.fromJson(Map<String, dynamic>.from(entry)));
      } catch (_) {}
    }
    return out;
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((e) => e.toJson()).toList(),
      'pageNo': pageNo,
      'pageSize': pageSize,
      'sectionCode': sectionCode,
      'sectionTitle': sectionTitle,
      'total': total,
    };
  }
}
